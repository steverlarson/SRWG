
USETEXTLINKS = 1
STARTALLOPEN = 0
WRAPTEXT = 1
PRESERVESTATE = 0
HIGHLIGHT = 1
ICONPATH = 'file:///C:/Users/Steve.Larson/Documents/WinArl35/WinArl35/'    //change if the gif's folder is a subfolder, for example: 'images/'

foldersTree = gFld("<i>ARLEQUIN RESULTS (AMOVA_4744_SRWG.arp)</i>", "")
insDoc(foldersTree, gLnk("R", "Arlequin log file", "Arlequin_log.txt"))
	aux1 = insFld(foldersTree, gFld("Run of 29/08/23 at 14:31:43", "AMOVA_4744_SRWG.htm#29_08_23at14_31_43"))
	insDoc(aux1, gLnk("R", "Settings", "AMOVA_4744_SRWG.htm#29_08_23at14_31_43_run_information"))
		aux2 = insFld(aux1, gFld("Genetic structure (samp=pop)", "AMOVA_4744_SRWG.htm#29_08_23at14_31_43_pop_gen_struct"))
		insDoc(aux2, gLnk("R", "Pairwise distances", "AMOVA_4744_SRWG.htm#29_08_23at14_31_43_pop_pairw_diff"))
