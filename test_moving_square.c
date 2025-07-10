#include <stdio.h>

// Forward declaration
int run_moving_square_game();

int main() {
    printf("Testing Moving Square Game...\n");
    int result = run_moving_square_game();
    printf("Game ended with result: %d\n", result);
    return result;
} 