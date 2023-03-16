const createToDoListTable = ''' 
CREATE TABLE IF NOT EXISTS `todo_lists` (
  `id` TEXT NOT NULL, 
  `name` TEXT NOT NULL, 
  `created_at` INTEGER NOT NULL, 
  `updated_at` INTEGER NOT NULL, 
  PRIMARY KEY(`id`)
)
''';

const queryToDoListWithTask = '''
SELECT 
  todo_lists.*,
  todo_tasks.id AS task_id,
  todo_tasks.name AS task_name,
  todo_tasks.status AS task_status,
  todo_tasks.completed_at AS task_completed_at,
  todo_tasks.created_at AS task_created_at,
  todo_tasks.updated_at AS task_updated_at
FROM 
  todo_lists 
  LEFT JOIN todo_tasks ON todo_lists.id = todo_tasks.list_id
WHERE 
  todo_lists.id = ?
''';
