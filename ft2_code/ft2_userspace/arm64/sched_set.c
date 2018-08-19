#include <sched.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc,char *argv[]) 
{
      struct sched_param param; 
      int maxpri; 
      maxpri = sched_get_priority_max(SCHED_FIFO); //
      if(maxpri == -1) 
      { 
            perror("sched_get_priority_max() failed"); 
            exit(1); 
      } 
      param.sched_priority = maxpri; 
      if (sched_setscheduler(getpid(), SCHED_FIFO, &param) != 0) //设置优先级
     { 
            printf("sched_setscheduler() failed");
            printf("[%s] failed, errno: %d", __FUNCTION__, errno);
            return -1;
     }
     printf("set scheduler ok\n");
}