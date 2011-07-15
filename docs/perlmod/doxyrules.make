DOXY_EXEC_PATH = /Users/phrfbf/work/WASPSelectionEffects/Everything
DOXYFILE = /Users/phrfbf/work/WASPSelectionEffects/Everything/Doxyfile
DOXYDOCS_PM = /Users/phrfbf/work/WASPSelectionEffects/Everything/docs/perlmod/DoxyDocs.pm
DOXYSTRUCTURE_PM = /Users/phrfbf/work/WASPSelectionEffects/Everything/docs/perlmod/DoxyStructure.pm
DOXYRULES = /Users/phrfbf/work/WASPSelectionEffects/Everything/docs/perlmod/doxyrules.make

.PHONY: clean-perlmod
clean-perlmod::
	rm -f $(DOXYSTRUCTURE_PM) \
	$(DOXYDOCS_PM)

$(DOXYRULES) \
$(DOXYMAKEFILE) \
$(DOXYSTRUCTURE_PM) \
$(DOXYDOCS_PM): \
	$(DOXYFILE)
	cd $(DOXY_EXEC_PATH) ; doxygen "$<"
