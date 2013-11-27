Feature: When a product is created, the product is listed in the store
    In order to simplify the addition of new products to the online store
    The admin logs in and is given access to the product creation page
    From the product creation page a new product is created and automatically added
    to the online store
    
    Background:
        Given I am logged in
        
    Scenario:
        Given I am at the product creation page
        When I select a product type
        And I press the "save" button
        Then the product is added to the database
        And the product is displayed on the "store"
    