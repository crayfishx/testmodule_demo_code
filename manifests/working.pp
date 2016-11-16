class testmodule::working {

  # test_two is evaluated first

  test_two { 'a': }
  test_two { 'b': }
  test_two { 'c': }

  test_one { 'a': }
  test_one { 'b': }
  test_one { 'c': }

}


