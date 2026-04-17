-- Run this in your Supabase SQL Editor

-- Stage control table
CREATE TABLE IF NOT EXISTS stage_control (
  id INTEGER PRIMARY KEY DEFAULT 1,
  current_stage INTEGER DEFAULT 0,
  stage1_open BOOLEAN DEFAULT FALSE,
  stage2_open BOOLEAN DEFAULT FALSE,
  updated_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO stage_control (id, current_stage, stage1_open, stage2_open)
VALUES (1, 0, FALSE, FALSE)
ON CONFLICT (id) DO NOTHING;

-- Stage 1 nominations table
CREATE TABLE IF NOT EXISTS nominations_stage1 (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nominator_name TEXT NOT NULL,
  nominator_department TEXT NOT NULL,
  male_nominee TEXT NOT NULL,
  female_nominee TEXT NOT NULL,
  male_punctuality INTEGER,
  male_team_collaboration INTEGER,
  male_quarterly_objectives INTEGER,
  male_service_in_love INTEGER,
  male_excellence INTEGER,
  male_integrity INTEGER,
  female_punctuality INTEGER,
  female_team_collaboration INTEGER,
  female_quarterly_objectives INTEGER,
  female_service_in_love INTEGER,
  female_excellence INTEGER,
  female_integrity INTEGER,
  submitted_at TIMESTAMP DEFAULT NOW()
);

-- Stage 2 nominations table
CREATE TABLE IF NOT EXISTS nominations_stage2 (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  nominator_name TEXT NOT NULL,
  nominator_department TEXT NOT NULL,
  male_nominee TEXT NOT NULL,
  female_nominee TEXT NOT NULL,
  male_punctuality INTEGER,
  male_team_collaboration INTEGER,
  male_quarterly_objectives INTEGER,
  male_service_in_love INTEGER,
  male_excellence INTEGER,
  male_integrity INTEGER,
  female_punctuality INTEGER,
  female_team_collaboration INTEGER,
  female_quarterly_objectives INTEGER,
  female_service_in_love INTEGER,
  female_excellence INTEGER,
  female_integrity INTEGER,
  submitted_at TIMESTAMP DEFAULT NOW()
);

-- Stage 2 candidates (departmental winners)
CREATE TABLE IF NOT EXISTS stage2_candidates (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  gender TEXT NOT NULL,
  department TEXT NOT NULL,
  added_at TIMESTAMP DEFAULT NOW()
);

-- Disable RLS on all tables
ALTER TABLE stage_control DISABLE ROW LEVEL SECURITY;
ALTER TABLE nominations_stage1 DISABLE ROW LEVEL SECURITY;
ALTER TABLE nominations_stage2 DISABLE ROW LEVEL SECURITY;
ALTER TABLE stage2_candidates DISABLE ROW LEVEL SECURITY;
