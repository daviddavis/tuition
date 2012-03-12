require 'spec_helper'

TRIALS = 10

describe "Students" do
  describe "GET /students" do
    before(:all) do
      #Course.delete_all
      #Student.delete_all
      #Payment.delete_all
      #load "#{Rails.root}/db/seeds.rb"
    end

    it "takes less than 1 second" do
      time = Time.now
      TRIALS.times do
        visit students_path
        page.should have_content(Student.last.email)
      end
      end_time = Time.now - time
      puts "Took #{end_time/TRIALS}"
      (end_time / TRIALS).should < 1
    end
  end
end
