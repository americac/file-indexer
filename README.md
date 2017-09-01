# File Indexer

## Requirements
The following are requirements to successfully run the script and related tests:

* ruby 2.3.1
* rspec

Reminder: run bundler before running the script or the tests:

```
bundle install
```

## Assumptions
* Ruby is installed on machine running the script and tests
* Input files are in plain text format
* FileIndexer is going to be used for sorting plain text files
* The script using/calling the class will take care of error handling, class methods will return false when something is not right

## Files and directories

* *file_indexer.rb* -  FileIndexer class
* *index_file.rb* - script used to parse one or more text files
* *test_files* - directory containing several sample input files
* *spec* - test directory

## Testing
To run the tests run:

```
rspec
```

## Script usage

To run the parsing script run:

```
./index_files.rb file_name_1
```

The script can accept multiple files as arguments:

```
./index_files.rb file_name_1 file_name_2
```

The return results limit is set to 10 but this can be changed when calling *display_top_results* method by passing a number to change the default.
Sample files can be found in the 'test_files' directory


## Class usage

```
fi = FileIndexer.new(file_name)
fi.display_top_results
```

To change result limit pass a limit as an argutment:

```
fi.display_top_result(4)
```

Note the default limit on results is 10 but if the limit passed is less than the available data can provide it will display all the results from the highest to the lowest count.

## How it works
The class has several methods which take care of specific tasks. I tried to keep them simple and one purpose oriented.

* *file_data* reads in the file and stores all unique words in a hash while counting the occurances in the file.
* *sort_results* sorts through the @word_hash created by *file_data* and sorts them in descending order.
* *top_results* takes the sorted results and returns the subset defined by either the default limit or limit passed by caller
* *print_top_results* expects an array of arrays results and prints them to stdout
* *display_top_results* is the main call to do all the things and display the top results

## Random thoughts
* naming convention of methods and variables could be better
* Words with apostrophe are being broken up, this could be improved on
* Is memory/space a concern?
