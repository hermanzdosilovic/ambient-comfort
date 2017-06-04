ActiveRecord::Schema.define(version: 20170604214115) do

  create_table "logs", force: :cascade do |t|
    t.datetime "created_at"
    t.decimal "temperature"
    t.decimal "moisture"
    t.decimal "pressure"
    t.decimal "brightness"
    t.decimal "noise"
  end

end
