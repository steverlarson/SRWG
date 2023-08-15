
USETEXTLINKS = 1
STARTALLOPEN = 0
WRAPTEXT = 1
PRESERVESTATE = 0
HIGHLIGHT = 1
ICONPATH = 'file:///C:/Users/Steve.Larson/Documents/WinArl35/WinArl35/'    //change if the gif's folder is a subfolder, for example: 'images/'

foldersTree = gFld("<i>ARLEQUIN RESULTS (AMOVA_4744_SRWG.arp)</i>", "")
insDoc(foldersTree, gLnk("R", "Arlequin log file", "Arlequin_log.txt"))
	aux1 = insFld(foldersTree, gFld("Run of 26/07/23 at 16:39:35", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35"))
	insDoc(aux1, gLnk("R", "Settings", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_run_information"))
		aux2 = insFld(aux1, gFld("Samples", ""))
		insDoc(aux2, gLnk("R", "pop_DI", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_group0"))
		insDoc(aux2, gLnk("R", "pop_DL", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_group1"))
		insDoc(aux2, gLnk("R", "pop_E68X", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_group2"))
		insDoc(aux2, gLnk("R", "pop_E72", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_group3"))
		insDoc(aux2, gLnk("R", "pop_SR", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_group4"))
		insDoc(aux2, gLnk("R", "pop_SR78", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_group5"))
		aux2 = insFld(aux1, gFld("Within-samples summary", ""))
		insDoc(aux2, gLnk("R", "Basic indices", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_comp_sum_Basic"))
		insDoc(aux2, gLnk("R", "Heterozygosity", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_comp_sum_het"))
		insDoc(aux2, gLnk("R", "Theta(H)", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_comp_sum_thetaH"))
		insDoc(aux2, gLnk("R", "No. of alleles", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_comp_sum_numAll"))
		aux2 = insFld(aux1, gFld("Genetic structure (samp=pop)", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_pop_gen_struct"))
		insDoc(aux2, gLnk("R", "Pairwise distances", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_pop_pairw_diff"))
		insDoc(aux2, gLnk("R", "Exact tests", "AMOVA_4744_SRWG.xml#26_07_23at16_39_35_pop_exct_tests"))
