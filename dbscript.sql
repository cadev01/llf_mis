

CREATE TABLE project_status (
    project_status_id INTEGER NOT NULL,
    status_name VARCHAR NOT NULL,
	PRIMARY KEY (project_status_id)
);


CREATE TABLE beneficiary_type (
    beneficiary_type_id INTEGER NOT NULL,
    beneficiary_type_name VARCHAR NOT NULL,
	PRIMARY KEY (beneficiary_type_id)

);

CREATE TABLE indicator_type (
    indicator_type_id INTEGER NOT NULL,
    indicator_type_name VARCHAR NOT NULL,
	PRIMARY KEY (indicator_type_id)
);

CREATE TABLE sector (
    sector_id INTEGER NOT NULL,
    sector_name VARCHAR NOT NULL,
	PRIMARY KEY (sector_id)
);


CREATE TABLE country (
    country_code varchar NOT NULL,
    country_name VARCHAR NOT NULL,
	PRIMARY KEY (country_code)
);

CREATE TABLE project (
	project_code varchar NOT NULL,
	project_name VARCHAR NOT NULL,
    pipeline_year varchar NOT NULL,
    implementing_partners varchar NOT NULL,
	executing_agency varchar NOT NULL,
	first_disbursement_date date NOT NULL,
	disbursement_till_date decimal NOT NULL,
	llf_financing_amount decimal NOT NULL,
	co_financing_amount decimal NOT NULL,
	goal varchar NOT NULL,
	expected_result varchar NOT NULL,
	sector_id INTEGER NOT NULL,
    project_status_id INTEGER NOT NULL,
    country_code varchar  NOT NULL,
	PRIMARY KEY (project_code),
    FOREIGN KEY(project_status_id) REFERENCES project_status (project_status_id),
	FOREIGN KEY(sector_id) REFERENCES sector (sector_id),
	FOREIGN KEY(country_code) REFERENCES country (country_code)
);

CREATE TABLE component (
    component_code varchar NOT NULL,
    component_name varchar NOT NULL,
project_code varchar NOT NULL,
	PRIMARY KEY (component_code),
FOREIGN KEY(project_code) REFERENCES project (project_code)
);


CREATE TABLE activities (
    activity_code varchar NOT NULL,
	component_code VARCHAR NOT NULL,
	narrative VARCHAR NOT NULL,
	start_date varchar NOT NULL,
	status VARCHAR NOT NULL,
    completed_date varchar NOT NULL,
    project_code varchar NOT NULL,
    reporting_month varchar NOT NULL,
    completion_rate varchar NOT NULL,
	PRIMARY KEY (activity_code),
    FOREIGN KEY(project_code) REFERENCES project (project_code),
	FOREIGN KEY(component_code) REFERENCES component (component_code)

);


CREATE TABLE indicator (
	indicator_code varchar NOT NULL,
	llf_indicator_code varchar NOT NULL,
	indicator_name VARCHAR NOT NULL,
	baseline_figure integer NOT NULL,
	pad_target INTEGER  NOT NULL,
    project_code varchar NOT NULL,
	component_code varchar NOT NULL,
    beneficiary_type_id INTEGER  NOT NULL,
	PRIMARY KEY (indicator_code),
    FOREIGN KEY(project_code) REFERENCES project (project_code),
    FOREIGN KEY(beneficiary_type_id) REFERENCES beneficiary_type (beneficiary_type_id),
	FOREIGN KEY(component_code) REFERENCES component (component_code)
);

CREATE TABLE result (
    result_code varchar NOT NULL,
    indicator_code varchar NOT NULL,
    reporting_month date NOT NULL,
    achieved_figure integer NOT NULL,
	project_code varchar NOT NULL,
	PRIMARY KEY (result_code),
	FOREIGN KEY(project_code) REFERENCES project (project_code),
    FOREIGN KEY(indicator_code) REFERENCES indicator (indicator_code)

);



Insert into component(component_code, project_code,component_name) values('MDV1012-CMPT01', 'MDV012', 'Enhance Fishing Infrastructure');
Insert into component(component_code, project_code,component_name) values('MDV1012-CMPT02', 'MDV012', 'Baseline & end-line assessment surveys');
Insert into component(component_code, project_code,component_name) values('MDV1012-CMPT03', 'MDV012', 'Design, supply, and installation of 200 RSW systems on fishing vessels to preserve large catches and improve fish quality.');
Insert into component(component_code, project_code,component_name) values('MDV1012-CMPT04', 'MDV012', 'Support the supply of 200  of solar PV plants installed on  fishing vessels/Support Renewable Energy');
Insert into component(component_code, project_code, component_name) values('MDV1012-CMPT05', 'MDV012', 'Support the upgrade of fishing storage capacity (3000 tons)');
Insert into component(component_code, project_code, component_name) values('MDV1012-CMPT06', 'MDV012', 'Strengthen Market linkages');
Insert into component(component_code, project_code ,component_name) values('MDV1012-CMPT07', 'MDV012', 'Support the conduct of market study (1) for both local and export markets');
Insert into component(component_code, project_code, component_name) values('MDV1012-CMPT08', 'MDV012', 'Support training and capacity development activities for the fishing community to adopt best and sustainable practices');

Insert into component(component_code, project_code, component_name) values('MDV1012-CMPT09', 'MDV012', 'Support access to financing for 200 small and medium enterprises along the fish value chains');


Insert into project_status (project_status_id,  status_name) values(1, 'Not Started');
Insert into project_status (project_status_id,  status_name) values(2, 'Implementing');
Insert into project_status (project_status_id,  status_name) values(3, 'Completed');

Insert into beneficiary_type (beneficiary_type_id,  beneficiary_type_name ) values(1,'beneficiary');
Insert into beneficiary_type (beneficiary_type_id,  beneficiary_type_name ) values(2,'household');
Insert into beneficiary_type (beneficiary_type_id,  beneficiary_type_name ) values(3,'trained');
Insert into beneficiary_type (beneficiary_type_id,  beneficiary_type_name ) values(4,'equipped');
Insert into beneficiary_type (beneficiary_type_id,  beneficiary_type_name ) values(5,'ha');
Insert into beneficiary_type (beneficiary_type_id,  beneficiary_type_name ) values(6,'km');
Insert into beneficiary_type (beneficiary_type_id,  beneficiary_type_name ) values(7,'NA');

Insert into indicator_type (indicator_type_id, indicator_type_name) values(1,'result');
Insert into indicator_type (indicator_type_id, indicator_type_name) values(2,'outcome');

Insert into  sector (sector_id,  sector_name) values(1, 'AGR');
Insert into  sector (sector_id,  sector_name) values(2, 'HLH');
Insert into  sector (sector_id,  sector_name) values(3, 'INF');


Insert into country (country_code, country_name) values('NGA', 'Nigeria');
Insert into country (country_code, country_name) values('SEN', 'Senegal');
Insert into country (country_code, country_name) values('MDV', 'Maldives');



insert into project (project_code ,
	project_name,
        pipeline_year,
        implementing_partners,
	executing_agency,
	first_disbursement_date,
	disbursement_till_date,
	llf_financing_amount,
	co_financing_amount,
	goal,
	expected_result ,
	sector_id,
        project_status_id,
        country_code
) values ('MDV1012','MDV1012 - Support People''s Livelihoods in the Fishery Sector in Maldives through Sustainable Energy ',' 2023','GoM','Ministry of Fisheries, Marine Resource''s and Agriculture', '30 November 2022','0.4 million, 3%','13.5 Million', 'NA', 'To boost post-covid economic recovery of the fisheries sector of Maldives through promotion and facilitation of access to technologies and techniques to increase profitability, improve catch quality, reduce post harvest losses and reduce reliance on fossil fuels.',  'The project increases the profitability from fishery activities (''Hama Agu'' Policy) among the small fisherman community through improving storage capacity and reducing wastage leading to increased sales and livelihoods (10% increase in incomes). 200 units of refrigerated sea water systems will be installed on vessel with 200 micro solar PV plants. These activities will be complemented by enhancing market linkages of the fisherman.',1,2,'MDV');

Insert into  activities (
        activity_code,
component_code,
	narrative,
	start_date,
	status,
        completed_date,
        project_code,
        reporting_month ,
       completion_rate

) values('ACT01', 'MDV1012-CMPT01', 'PMU has been formed that SDFC received the first and second batches of applications from beneficiaries but the process was cancelled due to lack of interest by the beneficiaries. EA/PMU proposed to change the scope and incentives for the beneficiaries. The proposal is cleared by GOM side. IsDB has provided No objection on change of implementation consult with Sharia and DGCP. SDFC is going to open call for interest from Fisherman hope fully by Sept 2024. RH Dhaka also received updated Implementation and expected disbursement by Nov 2024. The PMU/SDFC will conduct dialogue with the relevant stakeholders to fast truck selection of the beneficiaries for quick disbursement/procurement of project assets.', '01-Nov-2024','Pending','','MDV1012','Nov. 2024','5%');

Insert into  activities (
        activity_code,
component_code,
	narrative,
	start_date,
	status,
        completed_date,
        project_code,
        reporting_month ,
       completion_rate

) values('ACT02', 'MDV1012-CMPT02', 'PMU is working to confirm the baseline information from secondary sources by Q4, 2024. Once the beneficiaries are identified and construction of RSW completed the endline assessment will be done by PMU.', '01-Nov-2024','Pending','','MDV1012','Nov. 2024','0%');




Insert into  activities (
        activity_code,
component_code,
	narrative,
	start_date,
	status,
        completed_date,
        project_code,
        reporting_month ,
       completion_rate

) values('ACT03', 'MDV1012-CMPT03', 'RSW Consultant contract signed and the consultant is onboard from March 2024 and he is providing support to prepare specifications of RSW systems. With the changes brought to implementation of the project, beneficiary application is scheduled to open in September 2024. Project is expecting a favorable demand from the beneficiaries this time, especially with the inclusion of GEN set in the loan facility, and providing a discount rate for the beneficiaries as approved by MoF.', '01-Nov-2024','Pending','','MDV1012','Nov. 2024','10%');

Insert into  activities (
        activity_code,
component_code,
	narrative,
	start_date,
	status,
        completed_date,
        project_code,
        reporting_month ,
       completion_rate

) values('ACT04', 'MDV1012-CMPT04', 'EA will use the expertise of the consultant to review the SPV and Renewable energy component of the project in view of the Feedback from Fisherman/potential beneficiaries related to the Technical Feasibility and cost of The SPVs. In view of the findings that the SPV can not provide the required energy to operate the RSW system due to lack of available space on the vessel, the EA is considering to change the scope and include Energy efficient Generator.With the changes brought to implementation of the project, beneficiary application is scheduled to open in September 2024. However, expectations are low for the demand for Solar PV from the vessel owners, as it is considered not feasible in a cost-benefit analysis.', '01-Nov-2024','Pending','','MDV1012','Nov. 2024','1%');


Insert into  activities (
        activity_code,
component_code,
	narrative,
	start_date,
	status,
        completed_date,
        project_code,
        reporting_month ,
       completion_rate

) values('ACT05', 'MDV1012-CMPT05', 'This will be achieved after the procurement of the assets by the fishermen. As the selection of the Fishermen applications and resolution of challenges is on-going, the results are expected to start in Q4 2024.' , '01-Nov-2024','Pending','','MDV1012','Nov. 2024','0%');

Insert into  activities (
        activity_code,
component_code,
	narrative,
	start_date,
	status,
        completed_date,
        project_code,
        reporting_month ,
       completion_rate

) values('ACT06', 'MDV1012-CMPT06', 'Consultant hiring process has started;GOM has shared draft TOR for IsDB''s input. Procurement of consultant for market linkage/ assessment will commence in Q4 2024 and hopefully baseline assessment survey will be conducted in Q4, 2024.After conducting assessment actions will be taken for strengthening market Linkage.' , '01-Nov-2024','Pending','','MDV1012','Nov. 2024','5%');

Insert into  activities (
        activity_code,
component_code,
	narrative,
	start_date,
	status,
        completed_date,
        project_code,
        reporting_month ,
       completion_rate

) values('ACT07', 'MDV1012-CMPT07', 'Procurement of consultant for market linkage/ assessment will commence in Q4 2024 and baseline assessment survey will be conducted in Q4, 2024 hopefully.Market Assessment consultancy service is ready to be published. The TOR is now send to IsDB for review and approval.' , '01-Nov-2024','Pending','','MDV1012','Nov. 2024','5%');


Insert into  activities (
        activity_code,
component_code,
	narrative,
	start_date,
	status,
        completed_date,
        project_code,
        reporting_month ,
       completion_rate

) values('ACT08', 'MDV1012-CMPT08', 'Communications manager has been recruited. Communication framework/strategy/Communication Products has been drafted by EA. A meeting was done with IsDB LLF communications team/RH & PMU in q4 2023. Other communication materials development is under process. Training will start once selection of fishing community/beneficiaries are finalized. Market Assessment consultancy service is ready to be published. The TOR is now send to IsDB for review and approval.' , '01-Nov-2024','Pending','','MDV1012','Nov. 2024','10%');



Insert into  activities (
        activity_code,
component_code,
	narrative,
	start_date,
	status,
        completed_date,
        project_code,
        reporting_month ,
       completion_rate

) values('ACT09', 'MDV1012-CMPT09', 'It would be achieved once all the Fishermen have been selected and financed by the end of the project Q4 2025.' , '01-Nov-2024','Pending','','MDV1012','Nov. 2024','0%');




Insert into indicator (
	indicator_code,
	llf_indicator_code,
	indicator_name,
	baseline_figure,
	pad_target,
        project_code,
	component_code,
        beneficiary_type_id
) values('MDV1012-R01', 'INFRA01', 'Number of beneficiary agreements signed',0, 200, 'MDV1012', 'MDV1012-CMPT01', 1 );


Insert into indicator (
	indicator_code,
	llf_indicator_code,
	indicator_name,
	baseline_figure,
	pad_target,
        project_code,
	component_code,
        beneficiary_type_id
) values('MDV1012-R02', 'INFRA01', 'Amount of funds disbursed to approved beneficiaries',0, 0, 'MDV1012', 'MDV1012-CMPT01', 1 );

Insert into indicator (
	indicator_code,
	llf_indicator_code,
	indicator_name,
	baseline_figure,
	pad_target,
        project_code,
	component_code,
        beneficiary_type_id
) values('MDV1012-R03', 'INFRA02', 'Baseline assessment conducted',0, 0, 'MDV1012', 'MDV1012-CMPT02', 7 );


Insert into indicator (
	indicator_code,
	llf_indicator_code,
	indicator_name,
	baseline_figure,
	pad_target,
        project_code,
	component_code,
        beneficiary_type_id
) values('MDV1012-R04', 'INFRA02', 'Number of contracts signed for RSW systems',0, 0, 'MDV1012', 'MDV1012-CMPT03', 7);

Insert into indicator (
	indicator_code,
	llf_indicator_code,
	indicator_name,
	baseline_figure,
	pad_target,
        project_code,
	component_code,
        beneficiary_type_id
) values('MDV1012-R05', 'INFRA03', 'Number of beneficiaries receiving discounted financing with GEN set',0, 0, 'MDV1012', 'MDV1012-CMPT03', 1);

Insert into indicator (
	indicator_code,
	llf_indicator_code,
	indicator_name,
	baseline_figure,
	pad_target,
        project_code,
	component_code,
        beneficiary_type_id
) values('MDV1012-R06', 'INFRA03', '% decrease in the price per liter of water',0, 0, 'MDV1012', 'MDV1012-CMPT04', 7)






Insert into result (
        result_code,
	project_code,
        indicator_code,
        reporting_month,
       achieved_figure
) values('ARES01', 'MDV1012', 'MDV1012-R01', 'Nov. 2024' , 14 );


Insert into result (
        result_code,
	project_code,
        indicator_code,
        reporting_month,
       achieved_figure
) values('ARES02', 'MDV1012', 'MDV1012-R02', 'Nov. 2024' , 4 );

Insert into result (
        result_code,
	project_code,
        indicator_code,
        reporting_month,
       achieved_figure
) values('ARES03', 'MDV1012', 'MDV1012-R03', 'Nov. 2024' , 20);

Insert into result (
        result_code,
	project_code,
        indicator_code,
        reporting_month,
       achieved_figure
) values('ARES04', 'MDV1012', 'MDV1012-R04', 'Nov. 2024' , 0 );

Insert into result (
        result_code,
	project_code,
        indicator_code,
        reporting_month,
       achieved_figure
) values('ARES05', 'MDV1012', 'MDV1012-R05', 'Nov. 2024' , 74 );


Insert into result (
        result_code,
	project_code,
        indicator_code,
        reporting_month,
       achieved_figure
) values('ARES06', 'MDV1012', 'MDV1012-R06', 'Nov. 2024' , 6 );