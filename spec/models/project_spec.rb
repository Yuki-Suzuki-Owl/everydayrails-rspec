require 'rails_helper'

RSpec.describe Project, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = User.create(first_name:"Joe",last_name:"Tester",email:"joetester@example.com",password:"password")
    @user.projects.create(name:"Test Project")

    # @user = FactoryBot.create(:user,:with_project)
    # @project = FactoryBot.create(:project)
  end

  it "has a valid factory" do
    # expect(@project).to be_valid
  end

  it "is valid with a name,user_id" do
    project = Project.new(name:"first project",user_id:@user.id)
    expect(project).to be_valid
  end

  it "is invalid without a name" do
    project = Project.new(name:"",user_id:@user.id)
    project.valid?
    expect(project.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a user_id" do
    project = Project.new(name:"first project",user_id:nil)
    project.valid?
    expect(project.errors[:owner]).to include("must exist")
  end

  it "does not allow duplicate project names per user" do
    new_project = @user.projects.new(name:"Test Project")
    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end

  it "allows two users to share a project name" do
    other_user = User.create(first_name:"Jane",last_name:"Tester",email:"janetester@example.com",password:"password")
    other_project = other_user.projects.create(name:"Test Project")
    expect(other_project).to be_valid
  end

  it "can have many notes" do
    project = FactoryBot.create(:project,:with_notes)
    expect(project.notes.length).to eq 5
  end

  describe "late status" do
    it "is late when the due date is past today" do
      project = FactoryBot.create(:project,:project_due_yesterday)
      expect(project).to be_late
    end

    it "is on time when the due date is today" do
      project = FactoryBot.create(:project,:project_due_today)
      expect(project).to_not be_late
    end

    it "is on time when the due date is in the future" do
      project = FactoryBot.create(:project,:project_due_tomorrow)
      expect(project).to_not be_late
    end
  end
end
