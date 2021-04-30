require_relative '../../features/support/dsl/dsl'

Given("the category {string} selected") do |category|
  $test_id = '00006'
  @commonHelper = CommonHelpers.new()
  categories = $driver.find_elements(:class, 'sf-with-ul')

  if categories.length > 0

    categories.each do |category|
      # puts("\r\nCategory value:#{category.text}")
      if category.text.to_s.downcase.strip == category
        category.click
        break
      end
    end

  end
end

Then("wait for the products to load") do
  @commonHelper.wait_for_object_id({class: 'product_img_link'})
end

Then("extract all the image product links") do
  @commonHelper.create_href_list
  image_links = $driver.find_elements(:class,'product_img_link')

  if image_links.length > 0

    image_links.each do |link|
      url = link.attribute('href')
      title = link.attribute('title')
      # puts("\r\nLink Value:#{title}")
      # puts("\r\n\Product Image Link URL: #{url}")
      @commonHelper.write_file_href("#{title.to_s}||#{url.to_s}")
    end

  end
end

Then("redirect the page to product {string}") do |product|
  url_link = @commonHelper.read_href_link_text($href_file_path,product)
  @commonHelper.navigateTo(url_link)
end