wobbly(B):-
  bike(B),
  (
   broken_spokes(B)
  ;
   flat_tyre(B)
  ).

flat_tyre(B):-
  bike(B),
  (
   leaky_valve(B)
  ;
   puncture(B)
  ).

bike(b1).
bike(b2).
bike(b3).
bike(b4).

leaky_valve(b1).
broken_spokes(b2).
puncture(b3).

first_year(mary).
first_year(pat).
first_year(bob).
first_year(tony).

computing_student(mary).
computing_student(pat).
computing_student(bob).
computing_student(tony).

cw_mark(mary, 75).
cw_mark(pat, 80).
cw_mark(bob, 63).
cw_mark(tony, 57).

pro_mark(mary, 70).
pro_mark(pat, 25).
pro_mark(bob, 85).
pro_mark(tony, 65).

e1(mary, 60).
e1(pat, 75).
e1(bob, 40).
e1(tony, 20).

e2(mary, 65).
e2(pat, 80).
e2(bob, 50).
e2(tony, 80).

e3(mary, 70).
e3(pat, 63).
e3(bob, 80).
e3(tony, 90).

pass(Student):-
  computing_student(Name),
  pro_mark(Student, P),
  P >= 30,
  \+  
