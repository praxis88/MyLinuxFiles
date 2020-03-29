##Computes the actual number of cases for a given number of confirmed cases.

Confirmed = float(input('How many cases are confirmed? : '))
Actual = Confirmed * 5 * 32
#China Bayesian statistical analysis inferred 80% of cases fly under radar. 
#2^5 power is incubation period for symptom ramp up and testing. 

print('For every ', Confirmed, 'confirmed cases in the community, there are ', Actual, 'actual cases at that moment.')
