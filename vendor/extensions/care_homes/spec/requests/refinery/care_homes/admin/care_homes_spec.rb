# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "CareHomes" do
    describe "Admin" do
      describe "care_homes" do
        login_refinery_user

        describe "care_homes list" do
          before do
            FactoryGirl.create(:care_home, :name => "UniqueTitleOne")
            FactoryGirl.create(:care_home, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.care_homes_admin_care_homes_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.care_homes_admin_care_homes_path

            click_link "Add New Care Home"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::CareHomes::CareHome.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::CareHomes::CareHome.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:care_home, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.care_homes_admin_care_homes_path

              click_link "Add New Care Home"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::CareHomes::CareHome.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:care_home, :name => "A name") }

          it "should succeed" do
            visit refinery.care_homes_admin_care_homes_path

            within ".actions" do
              click_link "Edit this care home"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:care_home, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.care_homes_admin_care_homes_path

            click_link "Remove this care home forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::CareHomes::CareHome.count.should == 0
          end
        end

      end
    end
  end
end
