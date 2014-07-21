# Rails Practice - Staff Assignments

## Setup

* `bundle`
* `rake db:create db:migrate db:seed`
* `rails s`

You can run specs with:

* `rspec`

Note: email/password combinations for existing users populated by `rake db:seed` can be found in the db/seeds.rb file.

## Stories

**Users can add people**

```
Go to index page
Click "New Person"
Fill out form and click button
See the person appear on the index page
```

**Must enter a title/last_name or first_name/last_name**

```
While adding a person
Users must enter either a title/last_name or a first_name/last_name
Otherwise they get a validation message and the person isn't saved
```

**Users can see a person show page**

```
On the index page the names should be links
Clicking link brings users to show page
```

**Users can assign users to locations**

```
Go to person show page
Click on "+ Add Location"
Fill out form
View assignment on person show page
```

**Users can edit assignments**

```
Go to person show page
Click on the "edit" link by an assignment
Fill out form
View updated assignment on person show page
```

**Users can delete assignments**

```
Go to person show page
Click on the "delete" link by an assignment
Javascript prompt that says "Are you sure?" should appear
If user clicks "OK" then it should be deleted
```

## Wireframes

**Index**

<img src="project/images/01-index.png" />

**New Person**

<img src="project/images/02-new.png" />

**New Person w/ Errors**

<img src="project/images/03-new-with-errors.png" />

**Person Show Page**

<img src="project/images/04-show.png" />

**New Location Page**

<img src="project/images/05-new-location.png" />

**New Location w/ Errors**

<img src="project/images/06-new-location-with-errors.png" />

## References

* [collection_select](http://api.rubyonrails.org/classes/ActionView/Helpers/FormOptionsHelper.html#method-i-collection_select)
* [custom validations](http://guides.rubyonrails.org/active_record_validations.html#custom-methods)