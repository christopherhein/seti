# SETI

Ruby wrapper for the [SETIQuest info API](http://setiquest.info/)

## Installation

```bash
$ gem i seti
```

## Usage

The SETI api does not require any authentication or configuration so setup is not
required other then installing the gem and using it.

## Example Calls

Want to know whats happen when each kepler planet is going to be scanned pull this
and you will be able to access all that data.

```ruby
Seti.get.kepler_schedule
```

Want to get the status of the ATA as the current time use

```ruby
Seti.get.ata_status
```

Want to know the current day schedule for what is going to scanned and when

```ruby
Seti.get.ata_schedule
```

Want to get the morning report

```ruby
Seti.get.observation_report
```

## Resources:

* [SETIQuest info API](http://setiquest.info/)


## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2012 General Things Inc. See LICENSE for details.
