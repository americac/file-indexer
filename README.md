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
* FileIndexer is going to be used for sorting text files

## Files and directories

* *file_indexer.rb* -  FileIndexer class
* *index_file.rb* - script used to parse one or more text files
* *test_files* - directory containing several sample input files
* *spec* - text directory

## Testing
To run the tests run:

```
rspec
```

## Script Usage

To run the parsing script run:

```
./index_files.rb file_name_1
```

The script can accept multiple files as arguments:

```
./index_files.rb file_name_1 file_name_2
```

The return results limit is set to 10 but this can be changed when calling *display_results* method by passing a number to change the default.
Sample files can be found in the 'test_files' directory


## Class usage

* the file needs to be read first by calling *read_file_data*
* sort the data by calling *sort_result*
* print result byt calling *display_result*

Example:

```
fi = FileIndexer.new(file_name)
fi.read_file_data
fi.sort_result
fi.display_result
```

To change result limit pass a number to *display_result*:

```
fi.display_result(4)
```

Note the default result is 10 but if the limit passed is less than the available data contains it will display all the results from the highest to the lowest count.


## Random thoughts
* Words with apostrophe are being broken up. I attempted to extract them out without breaking them up but that proved to be challenging and would be considered out of scope at this point.
* Is memory/space a concern?
