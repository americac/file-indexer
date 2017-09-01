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

## Usage

To run the parsing script run:

```
./index_files.rb file_name_1
```

The script can accept multiple files as arguments:

```
./index_files.rb file_name_1 file_name_2
```

Sample files can be found in the 'test_files' directory

## Random thoughts
* Allow top word limit to be an argument, ie what if we want top 5 or top 15?  Out of scope but just a thought.
* Words with apostrophe are being broken up. I attempted to extract them out without breaking them up but that proved to be challenging and would be considered out of scope at this point.
* Is memory/space a concern?
