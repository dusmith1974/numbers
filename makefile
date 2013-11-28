CXXFLAGS = -std=c++11

P1 = projects/project_1
UTILS = utils

VPATH = $(P1):$(UTILS)
INC=-Iutils

OBJDIR := obj
OBJS := $(addprefix $(OBJDIR)/, $(patsubst %.cc, %.o, $(subst $(P1)/,,$(wildcard $(P1)/*.cc))))
OBJS += $(addprefix $(OBJDIR)/, $(patsubst %.cc, %.o, $(subst $(UTILS)/,,$(wildcard $(UTILS)/*.cc))))
OBJS += $(addprefix $(OBJDIR)/, $(patsubst %.cc, %.o, $(wildcard *.cc)))

$(OBJDIR)/%.o : %.cc 
	$(COMPILE.cc) $(INC) $(OUTPUT_OPTION) $<

all: numbers 

numbers: $(OBJS) 
	$(LINK.cc) $(OBJS) $(OUTPUT_OPTION)
	ctags -R --c-kinds=+cdefglmnpstuvx --extra=+f

$(OBJS): | $(OBJDIR)

$(OBJDIR):
	mkdir $(OBJDIR)

.PHONY: clean
clean :
	rm -f numbers output.log tags
	rm -rf $(OBJDIR) *.o
