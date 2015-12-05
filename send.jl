using SerialPorts
function sendpwm(intpwm,intpwm2)
print("PRESS ENTER TO START SENDING PWM VALUES")
readline()
s = SerialPorts.serialport("/dev/ttyACM1",115200)

for i = 1:length(intpwm)
write(s,string(string(intpwm[i])))
wait(Timer(.03))
write(s,string(string(intpwm2[i])))
wait(Timer(.03))
end
println("FINISHED :)")
end
