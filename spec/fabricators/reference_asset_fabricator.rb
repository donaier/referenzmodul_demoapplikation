Fabricator(:'ReferenceAssets::ReferenceImage') do
  reference
  type ReferenceAsset::TYPE_IMAGE
  size 'small'
  position 1
  asset File.open("#{Rails.root}/spec/support/test_files/test_image.jpg")
end
