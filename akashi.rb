include Math

revised_value = 1
sub_revised_value = 1
added_firepower = []
sub_firepower = []

count_list = 0..10
count_list.each do |value|
  added_firepower.push(revised_value * sqrt(value))
  sub_firepower.push(sub_revised_value * sqrt(value))
end

# def two_equipment(added_firepower)
#   improved_number = {}
#
#   reverse_added_firepower = added_firepower.reverse
#   reverse_added_firepower.each_with_index do |x, x_index|
#     x_label = 10 - x_index
#     reverse_added_firepower.each_with_index do |y, y_index|
#       y_label = 10 - y_index
#       next if y_label > x_label
#
#       combination_value = x + y
#
#       this_number = '★' + x_label.to_s unless x_label == 0
#       this_number = this_number + '★' + y_label.to_s unless y_label == 0
#
#       if x_label == 0 && y_label == 0
#         this_number = '★0'
#       end
#       improved_number[this_number] = combination_value.round(3)
#     end
#   end
#
#   sorted_number =  improved_number.sort_by { |key, value| [value, key] }.reverse
#   sorted_number.each do |key, value|
#     puts key.to_s + ' = ' + value.to_s
#   end
# end
#
# def three_equipment(added_firepower)
#   improved_number = {}
#
#   reverse_added_firepower = added_firepower.reverse
#   reverse_added_firepower.each_with_index do |x, x_index|
#     x_label = 10 - x_index
#     reverse_added_firepower.each_with_index do |y, y_index|
#       y_label = 10 - y_index
#       next if y_label > x_label
#
#       reverse_added_firepower.each_with_index do |z, z_index|
#         z_label = 10 - z_index
#         next if z_label > y_label
#
#         combination_value = x + y + z
#
#         this_number = '★' + x_label.to_s unless x_label == 0
#         this_number = this_number + '★' + y_label.to_s unless y_label == 0
#         this_number = this_number + '★' + z_label.to_s unless z_label == 0
#
#         if x_label == 0 && y_label == 0 && z_label == 0
#           this_number = '★0'
#         end
#         improved_number[this_number] = combination_value.round(3)
#       end
#     end
#   end
#
#   sorted_number =  improved_number.sort_by { |key, value| [value, key] }.reverse
#   sorted_number.each do |key, value|
#     puts key.to_s + ' = ' + value.to_s
#   end
# end

def three_sub_equipment(added_firepower, sub_firepower)
  improved_number = {}

  reverse_added_firepower = added_firepower.reverse
  reverse_sub_firepower = sub_firepower.reverse

  reverse_added_firepower.each_with_index do |x, x_index|
    x_label = 10 - x_index
    reverse_added_firepower.each_with_index do |y, y_index|
      y_label = 10 - y_index
      next if y_label > x_label

      reverse_sub_firepower.each_with_index do |z, z_index|
        z_label = 10 - z_index

        combination_value = x + y + z
        this_number = '主砲★' + x_label.to_s unless x_label == 0
        this_number = this_number + '★' + y_label.to_s unless y_label == 0
        this_number = this_number.to_s + '徹甲弾★' + z_label.to_s unless z_label == 0

        if x_label == 0 && y_label == 0 && z_label == 0
          this_number = '★0'
        end
        improved_number[this_number] = combination_value.round(3)
      end
    end
  end

  sorted_number =  improved_number.sort_by { |key, value| [value, key] }.reverse
  sorted_number.each do |key, value|
    puts key.to_s + ' = ' + value.to_s if key.to_s.include?('徹甲弾')
  end
end

# two_equipment(added_firepower)
# three_equipment(added_firepower)
three_sub_equipment(added_firepower, sub_firepower)
