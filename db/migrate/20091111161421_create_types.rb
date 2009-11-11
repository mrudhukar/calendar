class CreateTypes < ActiveRecord::Migration
  def self.up
    create_table :types do |t|
      t.string :label
      t.integer :position
      t.timestamps
    end

    change_table :events do |t|
      t.integer :type_id
    end

    position = 0
    ["Presidents","Vice Presidents","Prime ministers","Loksabha","Speaker","Five year plan","CEC","Cheif Justice","Wars","Other"].each do |string|
      position += 1
      t = Type.create!(:label => string, :position => position)
      Event.find_all_by_event_type(string).each do |event|
        event.update_attribute(:type_id, t.id)
      end
    end

    change_table :events do |t|
      t.remove :event_type
    end
  end

  def self.down
    change_table :events do |t|
      t.remove :type_id
      t.string :event_type
    end
    drop_table :types
  end
end
