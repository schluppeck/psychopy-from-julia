# sound playing example via
# https://github.com/lindeloev/psychopy-course/blob/master/ppc2_stimuli.py
#

using PyCall
# Psychopy sounds
sound = pyimport("psychopy.sound")
pygame = pyimport("pygame")

core = pyimport("psychopy.core")

clock = core.Clock()

sound = sound.Sound("recording.wav", secs=3.0)
sound.play()
core.wait(3.0)
