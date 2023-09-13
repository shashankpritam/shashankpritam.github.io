# CMake generated Testfile for 
# Source directory: /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex
# Build directory: /Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(Rips_complex_utility_from_rips_distance_matrix "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex/rips_distance_matrix_persistence" "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/data/distance_matrix/full_square_distance_matrix.csv" "-r" "1.0" "-d" "3" "-p" "3" "-m" "0")
set_tests_properties(Rips_complex_utility_from_rips_distance_matrix PROPERTIES  _BACKTRACE_TRIPLES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex/CMakeLists.txt;9;add_test;/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex/CMakeLists.txt;0;")
add_test(Rips_complex_utility_from_rips_on_tore_3D "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex/rips_persistence" "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/data/points/tore3D_1307.off" "-r" "0.25" "-m" "0.5" "-d" "3" "-p" "3")
set_tests_properties(Rips_complex_utility_from_rips_on_tore_3D PROPERTIES  _BACKTRACE_TRIPLES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex/CMakeLists.txt;20;add_test;/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex/CMakeLists.txt;0;")
add_test(Rips_complex_utility_from_rips_correlation_matrix "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex/rips_correlation_matrix_persistence" "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/data/correlation_matrix/lower_triangular_correlation_matrix.csv" "-c" "0.3" "-d" "3" "-p" "3" "-m" "0")
set_tests_properties(Rips_complex_utility_from_rips_correlation_matrix PROPERTIES  _BACKTRACE_TRIPLES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex/CMakeLists.txt;31;add_test;/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex/CMakeLists.txt;0;")
add_test(Sparse_rips_complex_utility_on_tore_3D "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/build/utilities/Rips_complex/sparse_rips_persistence" "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/data/points/tore3D_300.off" "-e" "0.5" "-m" "0.2" "-d" "3" "-p" "2")
set_tests_properties(Sparse_rips_complex_utility_on_tore_3D PROPERTIES  _BACKTRACE_TRIPLES "/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex/CMakeLists.txt;42;add_test;/Users/shashankpritam/github/personal/tda/gudhi.3.8.0/utilities/Rips_complex/CMakeLists.txt;0;")
