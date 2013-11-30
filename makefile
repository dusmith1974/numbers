CXXFLAGS = -std=c++11

P1 = projects/project_1
UTILS = utils

OBJDIR := obj

SRCS := $(wildcard $(P1)/*.cc)
SRCS += $(wildcard $(UTILS)/*.cc)
SRCS += $(wildcard *.cc)

OBJS := $(addprefix $(OBJDIR)/, $(patsubst %.cc, %.o, $(subst $(P1)/,,$(wildcard $(P1)/*.cc))))
OBJS += $(addprefix $(OBJDIR)/, $(patsubst %.cc, %.o, $(subst $(UTILS)/,,$(wildcard $(UTILS)/*.cc))))
OBJS += $(addprefix $(OBJDIR)/, $(patsubst %.cc, %.o, $(wildcard *.cc)))

VPATH = $(P1):$(UTILS)
INC=-Iutils -I$(BOOST_DIR)

$(OBJDIR)/%.o : %.cc 
	$(COMPILE.cc) $(INC) $(OUTPUT_OPTION) $<

all: numbers 

ifeq ($(MAKECMDGOALS),clean)
DEPS=
else
DEPS=$(OBJS:.o=.d)
$(OBJDIR)/%.d : %.cc
	$(CXX) $(CXXFLAGS) -MM $(INC) $< |sed -e '1 s/^/obj\//' > $@ 
-include $(DEPS)
endif

numbers: $(OBJS)
	$(LINK.cc) $(OBJS) $(OUTPUT_OPTION)
	ctags -R --c-kinds=+cdefglmnpstuvx --extra=+f


$(OBJS) $(DEPS) : | $(OBJDIR)

$(OBJDIR):
	mkdir $(OBJDIR)

.PHONY: clean
clean :
	rm -f numbers output.log
	rm -rf $(OBJDIR) *.o *.d
