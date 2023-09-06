
USETEXTLINKS = 1
STARTALLOPEN = 0
WRAPTEXT = 1
PRESERVESTATE = 0
HIGHLIGHT = 1
ICONPATH = 'file:///C:/Users/Steve.Larson/Documents/WinArl35/WinArl35/'    //change if the gif's folder is a subfolder, for example: 'images/'

foldersTree = gFld("<i>ARLEQUIN RESULTS (AMOVA_4744_SRWG.arp)</i>", "")
insDoc(foldersTree, gLnk("R", "Arlequin log file", "Arlequin_log.txt"))
	aux1 = insFld(foldersTree, gFld("Run of 29/08/23 at 15:45:37", "AMOVA_4744_SRWG.htm#29_08_23at15_45_37"))
	insDoc(aux1, gLnk("R", "Settings", "AMOVA_4744_SRWG.htm#29_08_23at15_45_37_run_information"))
		aux2 = insFld(aux1, gFld("Samples", ""))
		insDoc(aux2, gLnk("R", "pop_DI", "AMOVA_4744_SRWG.htm#29_08_23at15_45_37_group0"))
		insDoc(aux2, gLnk("R", "pop_DL", "AMOVA_4744_SRWG.htm#29_08_23at15_45_37_group1"))
		insDoc(aux2, gLnk("R", "pop_E68X", "AMOVA_4744_SRWG.htm#29_08_23at15_45_37_group2"))
		insDoc(aux2, gLnk("R", "pop_E72", "AMOVA_4744_SRWG.htm#29_08_23at15_45_37_group3"))
		insDoc(aux2, gLnk("R", "pop_SR", "AMOVA_4744_SRWG.htm#29_08_23at15_45_37_group4"))
		insDoc(aux2, gLnk("R", "pop_SR78", "AMOVA_4744_SRWG.htm#29_08_23at15_45_37_group5"))
		aux2 = insFld(aux1, gFld("Within-samples summary", ""))
		aux2 = insFld(aux1, gFld("Genetic structure (samp=pop)", "AMOVA_4744_SRWG.htm#29_08_23at15_45_37_pop_gen_struct"))
		insDoc(aux2, gLnk("R", "AMOVA", "AMOVA_4744_SRWG.htm#29_08_23at15_45_37_pop_amova"))
		insDoc(aux2, gLnk("R", "FIS per pop", "AMOVA_4744_SRWG.htm#29_08_23at15_45_37_amova_POP_AMOVA_FIS"))
		insDoc(aux2, gLnk("R", "Pairwise distances", "AMOVA_4744_SRWG.htm#29_08_23at15_45_37_pop_pairw_diff"))
