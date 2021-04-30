@view @all
Feature: View Product Page funcationality

@view_product
Scenario Outline: User should be able to populate Womens category and extract all product links
Given the category "<category>" selected
Then wait for the products to load
And extract all the image product links
Then redirect the page to product "<product_name>"

Examples:
|category|product_name         |
|women   |Printed Chiffon Dress|