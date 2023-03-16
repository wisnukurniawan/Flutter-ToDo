const createToDoTaskTable = ''' 
CREATE TABLE IF NOT EXISTS `todo_tasks` ( 
  `id` TEXT NOT NULL, 
  `name` TEXT NOT NULL, 
  `list_id` TEXT NOT NULL, 
  `status` TEXT NOT NULL, 
  `completed_at` INTEGER, 
  `created_at` INTEGER NOT NULL, 
  `updated_at` INTEGER NOT NULL, 
  PRIMARY KEY(`id`), 
  FOREIGN KEY(`list_id`) REFERENCES `todo_list`(`id`) 
  ON UPDATE NO ACTION ON DELETE CASCADE
)
''';

const createToDoTaskIndexTable = ''' 
CREATE INDEX IF NOT EXISTS `index_todo_tasks_list_id` 
  ON `todo_tasks` (`list_id`)
''';
