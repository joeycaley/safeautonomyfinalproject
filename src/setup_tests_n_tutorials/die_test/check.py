import stormpy

program = stormpy.parse_prism_program("/data/SafeAutonomyFinalProject/src/setup_tests_n_tutorials/die_test/die.pm")
formulas = stormpy.parse_properties('P=? [ F s=7 & d=6 ]', program)
model = stormpy.build_model(program, formulas)
result = stormpy.model_checking(model, formulas[0])
print(f"Result: {result.at(model.initial_states[0])}")