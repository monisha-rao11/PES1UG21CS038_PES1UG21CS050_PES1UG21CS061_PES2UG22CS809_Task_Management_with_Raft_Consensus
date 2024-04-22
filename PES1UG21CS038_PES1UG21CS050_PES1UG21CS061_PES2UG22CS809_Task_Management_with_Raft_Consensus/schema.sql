CREATE TABLE tasks (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  status ENUM('todo', 'in_progress', 'done') NOT NULL DEFAULT 'todo',
  due_date DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by_id INT NOT NULL,
  assigned_to_id INT,
  cluster_id INT NOT NULL,
  is_deleted BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (created_by_id) REFERENCES users(id),
  FOREIGN KEY (assigned_to_id) REFERENCES users(id),
  FOREIGN KEY (cluster_id) REFERENCES clusters(id)
);

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  cluster_id INT NOT NULL,
  FOREIGN KEY (cluster_id) REFERENCES clusters(id)
);

CREATE TABLE clusters (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) UNIQUE NOT NULL,
  leader_id INT,
  term INT DEFAULT 0,
  vote_count INT DEFAULT 0
);
