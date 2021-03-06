/* Relation attributes */
transitive(isa).
reflexive(isa).
transitive(haspart).

/* Class membership */
kb(stem_cell,isa,cell).
kb(pancreatic_cell,isa,cell).
kb(endocrine_cell,isa,cell).
kb(exocrine_cell,isa,cell).
kb(neuronal_schwann_cell,isa,cell).
kb(exocrine_pancreatic_cell,isa,exocrine_cell).
kb(exocrine_pancreatic_cell,isa,pancreatic_cell).
kb(endocrine_pancreatic_cell,isa,pancreatic_cell).
kb(endocrine_pancreatic_cell,isa,endocrine_cell).
kb(adult_stem_cell,isa,stem_cell).
kb(embryonic_stem_cell,isa,stem_cell).
kb(alpha_cell,isa,endocrine_pancreatic_cell).
kb(beta_cell,isa,endocrine_pancreatic_cell).
kb(omega_cell,isa,endocrine_pancreatic_cell).
kb(pp_cell,isa,endocrine_pancreatic_cell).
kb(centroacinar_cell,isa,exocrine_pancreatic_cell).
kb(acinar_cell,isa,exocrine_pancreatic_cell).

kb(glucagon,isa,hormone).
kb(insulin,isa,hormone).
kb(gastrin,isa,hormone).
kb(somatostatin,isa,hormone).
kb(pancreatic_polypeptide,isa,hormone).
kb(digestive_enzymes,isa,enzyme).
kb(acinar_cell,isa,enzyme).

/* Parthood */
kb(nervous_system,haspart,neuronal_schwann_cell).
kb(pancreas,haspart,exocrine_pancreas).
kb(pancreas,haspart,endocrine_pancreas).
kb(exocrine_pancreas,haspart,exocrine_pancreatic_cell).
kb(exocrine_pancreas,haspart,duct).
kb(endocrine_pancreas,haspart,islet_of_langerhans).
kb(islet_of_langerhans,haspart,capillary).
kb(islet_of_langerhans,haspart,pp_cell).
kb(islet_of_langerhans,haspart,omega_cell).
kb(islet_of_langerhans,haspart,beta_cell).
kb(islet_of_langerhans,haspart,alpha_cell).

/* Secretion */
kb(alpha_cell,secretes,glucagon).
kb(beta_cell,secretes,insulin).
kb(omega_cell,secretes,gastrin).
kb(omega_cell,secretes,somatostatin).
kb(pp_cell,secretes,pancreatic_polypeptide).
kb(centroacinar_cell,secretes,digestive_enzymes).
kb(acinar_cell,secretes,bicarbonate_ions).