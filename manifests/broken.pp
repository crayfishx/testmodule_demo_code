class testmodule::broken {

  # test_one is evaluated first.
  
  test_one { 'z': }

  test_two { 'a': }
  test_two { 'b': }
  test_two { 'c': }

  test_one { 'a': }
  test_one { 'b': }
  test_one { 'c': }

}


