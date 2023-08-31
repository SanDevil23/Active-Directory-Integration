package com.anand;

public class TableQueries {
	/*User Table Queries*/
	/*INSERT INTO `hr_anand`.`m_user`
	(`user_login_id`,`user_password`,`user_active`,
	`user_first_name`,`user_last_name`,
	`m_entity_id`,`m_designation_id`,`m_department_id`,`user_created_on`,
	`user_created_by`,`user_approved`,`user_approved_on`,`user_approved_by`)
	VALUES
	INSERT INTO `hr_anand`.`m_user`
	(`user_login_id`,`user_password`,`user_active`,
	`user_first_name`,`user_last_name`,
	`m_entity_id`,`m_designation_id`,`m_department_id`,`user_created_on`,
	`user_created_by`,`user_approved`,`user_approved_on`,`user_approved_by`)
	VALUES
	('sunil.tawale@mahle.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Sunil','	Tawle', 56, 1, 1, now(), 1, 1, now(), 1),
('lalit.verma@mahle.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Lalit','Verma', 51, 1, 1, now(), 1, 1, now(), 1),
('harshita.rusia@dana.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Harshita','Rusia', 28, 1, 1, now(), 1, 1, now(), 1),
('project.leader.mats@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Project Leader','MATS', 56, 1, 1, now(), 1, 1, now(), 1),
('sponsor.mats@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Sponsor','MATS', 56, 1, 1, now(), 1, 1, now(), 1),
('problem.solving.leader.mats@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Problem Solving Leader Primary','MATS', 56, 1, 1, now(), 1, 1, now(), 1),
('business.leader.coo.mats@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Business Leader COO','MATS', 56, 1, 1, now(), 1, 1, now(), 1),
('corporate.problem.solving.leader.mats@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Corporate Problem Solving Leader','MATS', 56, 1, 1, now(), 1, 1, now(), 1),
('process.owner.mats@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Process Owner','MATS', 56, 1, 1, now(), 1, 1, now(), 1),
('finance.controller.mats@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Finance Controller','MATS', 56, 1, 1, now(), 1, 1, now(), 1),
('project.leader.mafs@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Project Leader','MATS', 51, 1, 1, now(), 1, 1, now(), 1),
('sponsor.mafs@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Sponsor','MATS', 51, 1, 1, now(), 1, 1, now(), 1),
('problem.solving.leader.mafs@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Problem Solving Leader Primary','MATS', 51, 1, 1, now(), 1, 1, now(), 1),
('finance.controller.mafs@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Finance Controller','MATS', 51, 1, 1, now(), 1, 1, now(), 1),
('business.leader.coo.mafs@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Business Leader COO','MATS', 51, 1, 1, now(), 1, 1, now(), 1),
('corporate.problem.solving.leader.mafs@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Corporate Problem Solving Leader','MATS', 51, 1, 1, now(), 1, 1, now(), 1),
('process.owner.mafs@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Process Owner','MATS', 51, 1, 1, now(), 1, 1, now(), 1),
('project.leader.daipl@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Project Leader','DAIPL', 28, 1, 1, now(), 1, 1, now(), 1),
('sponsor.daipl@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Sponsor','DAIPL', 28, 1, 1, now(), 1, 1, now(), 1),
('problem.solving.leader.dailp@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Problem Solving Leader Primary','DAIPL', 28, 1, 1, now(), 1, 1, now(), 1),
('finance.controller.daipl@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Finance Controller','DAIPL', 28, 1, 1, now(), 1, 1, now(), 1),
('business.leader.coo.daipl@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Business Leader COO','DAIPL', 28, 1, 1, now(), 1, 1, now(), 1),
('corporate.problem.solving.leader.daipl@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Corporate Problem Solving Leader','DAIPL', 28, 1, 1, now(), 1, 1, now(), 1),
('process.owner.daipl@anandgroupindia.com'	, '$2a$10$h8PWSWQPDwC1T7jFUFn6neJcSt2gvnd5L3OXo/VmA5Z2.QqhgMqcm', 1,'Process Owner','DAIPL', 28, 1, 1, now(), 1, 1, now(), 1);*/
}
