# Deposits Exercise


## Requirements

A tradeline on a credit report represents an account, such as a credit card or car loan.

In the codebase, the following exists:

* The `Tradeline` model, which can be used to store tradelines in the database.
* A `Tradeline` controller, which serves both the `index` and `show` routes for tradelines.
* Basic `rspec` tests on the controller with a `tradeline` FactoryBot.

Add in the ability to create deposits for a specific tradeline using a JSON API call. You should store the deposit date (this is most likely a future date), and amount. Expose the outstanding balance for a given tradeline in the JSON output for `TradelinesController#show`, and `TradelinesController#index`. The oustanding balance should be calculated as the `amount` minus all of the deposit amounts.

In addition:

* A deposit should not be able to be created that exceeds the outstanding balance of a tradeline.
* You should return validation errors if a deposit cannot be created.
* Expose endpoints for seeing all deposits for a given tradeline, as well as seeing an individual deposit.

Feel free to add any gems to the `Gemfile`, and touch any of the existing code. For example, if you prefer to use PostgreSQL or MySQL over the included SQLite, or a serializer of your choice, please go ahead. This is not required, but you can be as creative as you want.

This exercise is purely API based, and will not have any frontend components. Please do not spend more than 3 hours on this.

## Setup

The exercise requires Ruby 3.3.0. Simply clone the repo, and run `bundle` to get started. This will install Rails 7.1.2, and the other specified gems.

## Submission

Please do not fork the repo; if forked accidentally, please delete the fork. For review, either of the following methods for submission are preferred:

* Cloning the repository and then uploading it under your Github account for review.
* Zipping up the directory.