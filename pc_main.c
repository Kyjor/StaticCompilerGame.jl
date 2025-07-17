#include <stdio.h>
#include <stdlib.h>

// External declaration of the Julia pc_main function
extern int pc_main(void);

int main(int argc, char* argv[]) {
    printf("🚀 Starting Julia + SDL2 Game...\n");
    
    // Call the Julia main function
    int result = pc_main();
    
    if (result == 0) {
        printf("✅ Game exited successfully\n");
    } else {
        printf("❌ Game exited with error code: %d\n", result);
    }
    
    return result;
} 