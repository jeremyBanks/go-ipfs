include mk/header.mk

dist_root_$(d)=/ipfs/QmNZL8wNsvAGdVYr8uGeUE9aGfHjFpHegAWywQFEdSaJbp

$(d)/gx: $(d)/gx-v0.9.0
$(d)/gx-go: $(d)/gx-go-v1.3.0

TGTS_$(d) := $(d)/gx $(d)/gx-go
CLEAN += $(TGTS_$(d))
DISTCLEAN += $(wildcard $(d)/gx-v*) $(wildcard $(d)/gx-go-v*)

PATH := $(d):$(PATH)

$(TGTS_$(d)):
	rm -f $@
	ln -s $(notdir $^) $@

bin/gx-v%:
	@echo "installing gx $(@:bin/gx-%=%)"
	bin/dist_get $(dist_root_bin) gx $@ $(@:bin/gx-%=%)

bin/gx-go-v%:
	@echo "installing gx-go $(@:bin/gx-go-%=%)"
	@bin/dist_get $(dist_root_bin) gx-go $@ $(@:bin/gx-go-%=%)

include mk/footer.mk