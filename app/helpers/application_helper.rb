module ApplicationHelper
  def display_rating(experience)
    rating = calc_rating(experience)

    if rating < 0.25
      image_tag('empty_star.svg', class: 'rating-star').to_s * 5
    elsif rating >= 0.25 && rating < 0.5
      "#{image_tag('1_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 4}"
    elsif rating >= 0.5 && rating < 0.75
      "#{image_tag('half_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 4}"
    elsif rating >= 0.75 && rating < 1
      "#{image_tag('3_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 4}"
    elsif rating >= 1 && rating < 1.25
      "#{image_tag('full_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 4}"
    elsif rating >= 1.25 && rating < 1.5
      "#{image_tag('full_star.svg', class: 'rating-star')}#{image_tag('1_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 3}"
    elsif rating >= 1.5 && rating < 1.75
      "#{image_tag('full_star.svg', class: 'rating-star')}#{image_tag('half_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 3}"
    elsif rating >= 1.75 && rating < 2
      "#{image_tag('full_star.svg', class: 'rating-star')}#{image_tag('3_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 3}"
    elsif rating >= 2 && rating < 2.25
      "#{image_tag('full_star.svg', class: 'rating-star') * 2}#{image_tag('empty_star.svg', class: 'rating-star') * 3}"
    elsif rating >= 2.25 && rating < 2.5
      "#{image_tag('full_star.svg', class: 'rating-star') * 2}#{image_tag('1_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 2}"
    elsif rating >= 2.5 && rating < 2.75
      "#{image_tag('full_star.svg', class: 'rating-star') * 2}#{image_tag('half_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 2}"
    elsif rating >= 2.75 && rating < 3
      "#{image_tag('full_star.svg', class: 'rating-star') * 2}#{image_tag('3_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 2}"
    elsif rating >= 3 && rating < 3.25
      "#{image_tag('full_star.svg', class: 'rating-star') * 3}#{image_tag('empty_star.svg', class: 'rating-star') * 2}"
    elsif rating >= 3.25 && rating < 3.5
      "#{image_tag('full_star.svg', class: 'rating-star') * 3}#{image_tag('1_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 1}"
    elsif rating >= 3.5 && rating < 3.75
      "#{image_tag('full_star.svg', class: 'rating-star') * 3}#{image_tag('half_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 1}"
    elsif rating >= 3.75 && rating < 4
      "#{image_tag('full_star.svg', class: 'rating-star') * 3}#{image_tag('3_4_star.svg', class: 'rating-star')}#{image_tag('empty_star.svg', class: 'rating-star') * 1}"
    elsif rating >= 4 && rating < 4.25
      "#{image_tag('full_star.svg', class: 'rating-star') * 4}#{image_tag('empty_star.svg', class: 'rating-star') * 2}"
    elsif rating >= 4.25 && rating < 4.5
      "#{image_tag('full_star.svg', class: 'rating-star') * 4}#{image_tag('1_4_star.svg', class: 'rating-star')}"
    elsif rating >= 4.5 && rating < 4.75
      "#{image_tag('full_star.svg', class: 'rating-star') * 4}#{image_tag('half_star.svg', class: 'rating-star')}"
    elsif rating >= 4.75 && rating < 5
      "#{image_tag('full_star.svg', class: 'rating-star') * 4}#{image_tag('3_4_star.svg', class: 'rating-star')}"
    elsif rating >= 5
      image_tag('full_star.svg', class: 'rating-star').to_s * 5
    end
  end

  def calc_rating(experience)
    experience.comments.average(:rating)
  end

  def inline_svg(filename, options = {})
    asset = "app/assets/images/#{filename}.svg"
    if File.exist?(asset)
      file = File.open(asset, 'r', &:read)
      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      svg = doc.at_css('svg')

      svg['class'] = options[:class] if options[:class].present?

      doc
    else
      %(
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 30"
          width="400px" height="30px"
        >
          <text font-size="16" x="8" y="20" fill="#cc0000">
            Error: '#{filename}' could not be found.
          </text>
          <rect
            x="1" y="1" width="398" height="28" fill="none"
            stroke-width="1" stroke="#cc0000"
          />
        </svg>
      )
    end
  end
end
