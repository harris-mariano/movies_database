# frozen_string_literal: true

def seed_image(file_name)
  File.open(File.join("#{Rails.root}/app/assets/images/#{file_name}"))
end

genres = ['Action', 'Horror', 'Fiction', 'Hero', 'Love Story', 'Adventure', 'Cartoons']
directors = ['Howard Fritz', 'Harris Mariano', 'Herbert Neve']
lorems = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Non nisi est sit amet facilisis magna etiam tempor. Pharetra sit amet aliquam id diam maecenas ultricies mi eget. Scelerisque in dictum non consectetur a erat. Vulputate odio ut enim blandit volutpat maecenas. Quam elementum pulvinar etiam non. Montes nascetur ridiculus mus mauris vitae ultricies leo integer. Malesuada fames ac turpis egestas. Sed cras ornare arcu dui vivamus arcu. Massa vitae tortor condimentum lacinia quis vel. Libero enim sed faucibus turpis in eu mi bibendum neque. Eu mi bibendum neque egestas congue quisque egestas diam in. Enim tortor at auctor urna nunc id cursus metus aliquam. Ut porttitor leo a diam sollicitudin tempor id eu. Adipiscing elit pellentesque habitant morbi tristique senectus et. Nulla facilisi nullam vehicula ipsum a arcu. Pellentesque diam volutpat commodo sed. Ut porttitor leo a diam sollicitudin tempor. Diam quam nulla porttitor massa id neque aliquam vestibulum morbi. In ante metus dictum at tempor.", "Mauris commodo quis imperdiet massa. Suspendisse sed nisi lacus sed viverra. Eleifend quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus. Vestibulum mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa. At erat pellentesque adipiscing commodo elit at imperdiet dui accumsan. Laoreet suspendisse interdum consectetur libero id faucibus nisl. Odio ut sem nulla pharetra diam. Netus et malesuada fames ac turpis egestas integer eget aliquet. Porta nibh venenatis cras sed felis eget. Lacus sed viverra tellus in hac habitasse. Adipiscing at in tellus integer feugiat scelerisque varius morbi. Vitae tempus quam pellentesque nec nam aliquam sem et. Molestie a iaculis at erat pellentesque adipiscing commodo elit. Nibh cras pulvinar mattis nunc. Nulla facilisi morbi tempus iaculis urna.", "Pulvinar elementum integer enim neque volutpat. Leo vel fringilla est ullamcorper. Fringilla urna porttitor rhoncus dolor purus non enim praesent elementum. Duis at tellus at urna condimentum mattis pellentesque id. Auctor elit sed vulputate mi. Morbi blandit cursus risus at ultrices mi. Quam adipiscing vitae proin sagittis nisl. Volutpat consequat mauris nunc congue nisi vitae suscipit. Commodo quis imperdiet massa tincidunt nunc pulvinar sapien. Mauris sit amet massa vitae tortor. Pharetra sit amet aliquam id diam maecenas ultricies mi. Eget lorem dolor sed viverra ipsum. Lectus vestibulum mattis ullamcorper velit sed. Sed id semper risus in hendrerit gravida. Sed cras ornare arcu dui vivamus arcu felis bibendum. Eros donec ac odio tempor orci dapibus ultrices in. Lorem ipsum dolor sit amet consectetur adipiscing. In est ante in nibh mauris cursus mattis molestie a."]

Movie.destroy_all

Dir.foreach(File.join("#{Rails.root}/app/assets/images")) do |filename|
  next if filename == '.' || filename == '..'

  Movie.create(
    title: filename.split(".").first.humanize,
    genre: genres[rand(0..6)],
    release_year: rand(2010..2020).to_s,
    director: directors[rand(0..2)],
    story: lorems[rand(0..2)],
    image: seed_image(filename)
  )
end
