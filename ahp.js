// #region For Testing
var acad_crit = [[1,5,9], [0.2,1,2], [0.11,0.5,1]];
var car_crit = [[1,1,5,0.125], [1,1,4,0.1428], [0.2,0.25,1,0.11], [8,7,9,1]];
var crit_weights = [0.3, 0.7];      // 0.3 for academic & 0.7 for career

var acad_weights = matrix_weights(acad_crit);
var car_weights = matrix_weights(car_crit);

var major_acad_weights = [[0.2,0.8], [0.5,0.5], [0.6,0.4]];
var major_car_weights = [[0.25,0.75], [0.68,0.32], [0.5,0.5], [0.9,0.1]];

majors_weights(crit_weights, acad_weights, car_weights, major_acad_weights, major_car_weights);
// #endregion


/// Find the weights of values for the provided matrix.
/// Input is a square matrix with the criterias or values.
/// Output is an array with the weights for values.
function matrix_weights(input_matrix){
    let matrix_size = input_matrix[0].length;
    // console.log(`Matrix size is ${matrix_size}`);    
    let col_sum = Array(matrix_size);   // Array to store the sum of column values.

    // Find the sum of values in each column
    for (let col = 0; col < matrix_size; col++) {
        let sum = 0;                
        for (let row = 0; row < matrix_size; row++) {
            sum += input_matrix[row][col];
        }        
        col_sum[col] = sum;
    }
    // console.log(`Column sum is ${col_sum}`);

    // Calculate the weight of values by dividing the value by the sum of values in that column.
    // Calculate the AHP value for each row by adding the weights and dividing the sum by matrix size.
    weights_sum = Array(matrix_size).fill(0);
    for (let row = 0; row < matrix_size; row++) {
        for (let col = 0; col < matrix_size; col++) {
            input_matrix[row][col] /= col_sum[col];
            weights_sum[row] += input_matrix[row][col];
        }        
    }
    // Convert sum of weights to ahp values by dividing the sum by matrix size.
    weights_sum = weights_sum.map((element) => element/matrix_size);
    // console.log(`AHP values are ${weights_sum}`);

    return weights_sum;
}

/// Find the weight of each major based on the academic and career criteria weights
/// Inputs are the weight array for criterias (academic & career), 
/// weight arrays for acedemic & career weights, 
/// the matrix for major weights for each academic criteria, and 
/// the matrix for major weights for each career criteria.
/// Output will be the array containing the weights for each major. The number pf elements in the output
/// will be equal to number of rows in the input matrix for major weights for each criteria.
function majors_weights(crit_weights, acad_weights, car_weights, major_acad_weights, major_car_weights){
    let majors_count = major_car_weights[0].length;
    final_weights = Array(majors_count);
    for (let col = 0; col < majors_count; col++) {
        acad_weight = 0;
        car_weight = 0;

        // For acedemic criterias
        if(acad_weights == null || acad_weights.length < 1){
            acad_weight = crit_weights[0];
        }
        else{
            for (let row = 0; row < major_acad_weights.length; row++) {
                acad_weight += major_acad_weights[row][col] * acad_weights[row];
            }
            acad_weight *= crit_weights[0];
        }

        // For career criterias
        if(car_weights == null || car_weights.length < 1){
            car_weight = crit_weights[1];
        }
        else{
            for (let row = 0; row < major_car_weights.length; row++) {
                car_weight += major_car_weights[row][col] * car_weights[row];
            }
            car_weight *= crit_weights[1];
        }

        final_weights[col] = acad_weight + car_weight;
    }

    // console.log(`Final weights are ${final_weights}`);
    return final_weights;
}