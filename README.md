## Tasks
# #1 Task (XML Handling)
The `executor.rb` file inside task_1 directory needs to be run, it have to sub directories, data to store xml files, and modules that do the actual labour of reading and converting xml to hash.
```
cd task_1
ruby executor.rb
```

# #2 Task(Count array and sort)
The `count_array_and_sort.rb` file needs to be executed, this problem could be solved with multiple approaches but since project is on ruby 2.7, i did it in same version while using short hands methods provided by this ruby version. Like `tally` method.
This solution is implemented with two approaches.
```
cd task_2
ruby count_array_and_sort.rb
```
# #3 Task(Handle Position)
In this task i have used two models one is actual item while other is just navigation.
After deleting an item from list we can have two different approaches to reposition other items.
1. Set position for all items
2. Only update position for items which occur after the remove item in list
    This method will work good if we have a big dataset as we will not have to treverse from whole array again and again.
For Rails and ActiveRecord Model callbacks will be used.
I Have created a Model file for you to have a look if we actually have to implement in rails model.
```
cd task_3
ruby solution_1.rb
```

# #4 Task(Base64 to Image)
This task is written in ruby file, The main directory of this tasks `task_4` contanins two directories and 1 ruby file. The  `modules` directory have required modules in it. The `root` directory have subdirectory `tmp` to store image file there as in this case we are assuming image is getting saved in Rails tmp directory. Since this is not written using Rails gem, this path is getting used, but in case of Rails you just need to write `Rails.root.join('tmp', 'image.png')`.
```
cd task_4
ruby base64_to_image.rb
```
# #5 Task(Delete Duplicates)
Added two approaches for this task
1. Simple ruby based solution, A class is created and using that class to store entries, then removing duplicated entries.
2. Added a method which can be added in Rails Model to remove duplicate records.
```
cd task_5
ruby solution_1.rb
```

# #6 Task(Create a duration)
This is convert a file from PDF to PDF/A1-b format. I am using gs(Ghost Script) here assuming it is already installed in machine.
PS: (I had to develop it on my friends linux machine as my mac wasnot allowing me to install GS)
```
cd task_6
ruby convertion.rb
```

# #7 Task(Response Check)
For this task i am using `https://httpstat.us` with random status code b/w [200,500], The reason to do so is to randomize request so that it can actually get either 200 or 500 status code.
```
cd task_7
ruby response_checker.rb
```
# #8 Task(Regex)
This task is done in one file, I have added a random true/false to create valid or invalid password.
Code will run untill it prints a valid password. It will also print invalid passwords
```
cd task_8
ruby regex_tester.rb
```
