# running psychopy from julia
#
# ds 2019-04-06
#
# psychopy code from
# https://www.psychopy.org/coder/tutorial1.html

using PyCall

# from psychopy import visual, core
# is done this way:
visual = pyimport("psychopy.visual")
core = pyimport("psychopy.core")
event = pyimport("psychopy.event")
#create a window
mywin = visual.Window([800,600], monitor="testMonitor", units="deg")

#create some stimuli
grating = visual.GratingStim(win=mywin, mask="circle", size=3, pos=[-4,0], sf=3)
fixation = visual.GratingStim(win=mywin, size=0.1, pos=[0,0], sf=0, rgb=-1)

#draw the stimuli and update the window
while true #this creates a never-ending loop
    grating.phase += [0.05; 0.05];  #advance phase by 0.05 of a cycle
    grating.draw()
    fixation.draw()
    mywin.flip()

    if length(event.getKeys()) > 0
        break
    end
    event.clearEvents()
end

#cleanup
mywin.close()
