class TodosController < ApplicationController

  def index
    @todos = current_user.todos
  end

  def show
    @todo = current_user.todos.find(params[:id])
  end

  def new
    @todo = current_user.todos.new
  end

  def create
    new_todo = current_user.todos.create(todo_params)
    new_todo.save

    redirect_to new_todo
  end

  def edit
    @todo = current_user.todos.find(params[:id])
  end

  def update
    todo = current_user.todos.find(params[:id])
    todo.update(todo_params)

    redirect_to todo
  end

  def destroy
    current_user.todos.destroy(params[:id])
    redirect_to todos_url
  end
end

  # create_table "todos", force: :cascade do |t|
  #   t.string "title"
  #   t.text "body"
  #   t.integer "user_id"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end

  # create_table "users", force: :cascade do |t|
  #   t.string "email", default: "", null: false
  #   t.string "encrypted_password", default: "", null: false
  #   t.string "reset_password_token"
  #   t.datetime "reset_password_sent_at"
  #   t.datetime "remember_created_at"
  #   t.integer "sign_in_count", default: 0, null: false
  #   t.datetime "current_sign_in_at"
  #   t.datetime "last_sign_in_at"
  #   t.inet "current_sign_in_ip"
  #   t.inet "last_sign_in_ip"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["email"], name: "index_users_on_email", unique: true
  #   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
