CXXFLAGS = -std=c++11

P1 = projects/project_1
UTILS = utils
BASE = .

PRJS := $(P1) $(UTILS) $(BASE)

OBJDIR = lib
BIN_DIR = bin

SRCS := $(foreach prj, $(PRJS), $(wildcard $(prj)/*.cc))
OBJS := $(foreach prj, $(PRJS), $(addprefix $(OBJDIR)/, $(patsubst %.cc, %.o, $(subst $(prj)/,,$(wildcard $(prj)/*.cc)))))

VPATH := $(addsuffix :, $(PRJS))
INC := $(addprefix -I, $(PRJS))
INC += -I$(BOOST_DIR)

$(OBJDIR)/%.o : %.cc 
	$(COMPILE.cc) $(INC) $(OUTPUT_OPTION) $<

all: $(BIN_DIR)/numbers 

ifeq ($(MAKECMDGOALS),clean)
DEPS=
else
DEPS=$(OBJS:.o=.d)
$(OBJDIR)/%.d : %.cc
	$(CXX) $(CXXFLAGS) -MM $(INC) $< |sed -e '1 s/^/obj\//' > $@ 
-include $(DEPS)
endif

$(BIN_DIR)/numbers: $(OBJS)
	$(LINK.cc) $(OBJS) $(OUTPUT_OPTION)
	ctags -R --c-kinds=+cdefglmnpstuvx --extra=+f


$(OBJS) $(DEPS) : | $(OBJDIR) $(BIN_DIR)

$(OBJDIR):
	mkdir $(OBJDIR)

$(BIN_DIR):
	mkdir $(BIN_DIR)

.PHONY: clean
clean :
	rm -f numbers output.log
	rm -rf $(OBJDIR) $(BIN_DIR) *.o *.d
