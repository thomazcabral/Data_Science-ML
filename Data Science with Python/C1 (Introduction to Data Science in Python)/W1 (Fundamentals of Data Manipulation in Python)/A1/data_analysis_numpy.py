import numpy as np

college = np.genfromtxt("data.csv", delimiter=",", skip_header=1, names=("private","apps","accept","enroll","top10perc","top25perc","f_undergrad","p_undergrad","outstate","room_board","books","personal","phd","terminal","s_f_ratio","perc_alumni","expend","grad_rate"))

top_25 = college[college["top25perc"] > 75]["grad_rate"].mean()
worst_25 = college[college["top25perc"] < 25]["grad_rate"].mean()
print(f"Average grade of colleges with a lot of good students: {top_25}")
print(f"Average grade of colleges with few good students: {worst_25}\n")

college["private"] = college["accept"] / college["apps"] * 100 # now the college["private"] will represent the acceptance rate of new students

high_acceptance = college[college["private"] > 90]["grad_rate"].mean()
low_acceptance = college[college["private"] < 50]["grad_rate"].mean()
print(f"Average grade of colleges with high acceptance rate: {high_acceptance}")
print(f"Average grade of colleges with low acceptance rate: {low_acceptance}\n")

high_acceptance_enrollment = (college[college["private"] > 90]["enroll"].mean()) / college[college["private"] > 90]["accept"].mean() * 100
low_acceptance_enrollment = college[college["private"] < 50]["enroll"].mean() / college[college["private"] < 50]["accept"].mean() * 100
print(f"Enrollment percentage in colleges with high acceptance rate: {high_acceptance_enrollment}")
print(f"Enrollment percentage in colleges with low acceptance rate: {low_acceptance_enrollment}\n")
