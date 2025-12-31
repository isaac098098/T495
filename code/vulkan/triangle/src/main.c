#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <GLFW/glfw3.h>
#include <vulkan/vulkan.h>
// #include <cglm/cglm.h>

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600

static void key_callback(GLFWwindow *window, int key, int scancode, int action, int mods);

int main() {
    /* glfw window creation */

    if(!glfwInit()) {
        fprintf(stderr, "could not initialize glfw\n");
        return -1;
    }

    glfwWindowHint(GLFW_CLIENT_API, GLFW_NO_API);
    glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);
    glfwWindowHintString(GLFW_X11_CLASS_NAME, "Vulkan");

    GLFWwindow *window = glfwCreateWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "Vulkan Window",
                                                                           NULL, NULL);

    if(window == NULL) {
        fprintf(stderr, "could not create window or context\n");
        return -1;
    }

    glfwSetKeyCallback(window, key_callback);

    /* vulkan instance creation */

    VkInstance instance;

    VkApplicationInfo app_info = {0};

    app_info.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    app_info.pApplicationName = "Triangle";
    app_info.applicationVersion = VK_MAKE_API_VERSION(0, 1, 0, 0);
    app_info.apiVersion = VK_API_VERSION_1_0;

    VkInstanceCreateInfo create_info = {0};

    create_info.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    create_info.pApplicationInfo = &app_info;

    // validation layers request

    int enable_validation_layers = 1;

    if(enable_validation_layers == 1) {

        // requested layers

        const char *validation_layers_request[] = {
            "VK_LAYER_KHRONOS_validation"
        };
        uint32_t validation_layers_request_count = (sizeof(validation_layers_request) /
                                                    sizeof(validation_layers_request[0]));

        // get and list all available validation layers

        uint32_t available_layers_count = 0;
        vkEnumerateInstanceLayerProperties(&available_layers_count, NULL);
        VkLayerProperties *available_layers = malloc(available_layers_count *
                                                     sizeof(VkLayerProperties));
        vkEnumerateInstanceLayerProperties(&available_layers_count, available_layers);

        // for(size_t i = 0; i < available_layers_count; i++) {
            // printf("layer %lu: %s\n", i, available_layers[i].layerName);
            // printf("spec version: %u\n", available_layers[i].specVersion);
            // printf("implementation version: %u\n",
                   // available_layers[i].implementationVersion);
            // printf("description: %s\n", available_layers[i].description);

            // if(i != available_layers_count - 1)
                // printf("\n");
        // }

        // search for requested layers

        for(size_t i = 0; i < validation_layers_request_count; i++) {
            const char* requested_layer = validation_layers_request[i];
            int found = 0;

            for(size_t j = 0; j < available_layers_count; j++) {
                char *available_layer = available_layers[j].layerName;

                if(strcmp(requested_layer, available_layer) == 0) {
                    found = 1;
                    printf("layer %s available\n", requested_layer);
                    break;
                }
            }
            if(found == 0) {
                fprintf(stderr, "layer %s not available\n", requested_layer);
                
                free(available_layers);

                glfwDestroyWindow(window);
                glfwTerminate();

                return -1;
            }
        }

        // include validation layer names in instance creation

        create_info.enabledLayerCount = validation_layers_request_count;
        create_info.ppEnabledLayerNames = validation_layers_request;

        free(available_layers);
    }

    // get and list all vulkan extensions
    
    // uint32_t extension_count = 0;
    // vkEnumerateInstanceExtensionProperties(NULL, &extension_count, NULL);
    // VkExtensionProperties *extensions_info = malloc(extension_count *
                                                    // sizeof(VkExtensionProperties));
    // vkEnumerateInstanceExtensionProperties(NULL, &extension_count, extensions_info);
    // printf("extension_count: %u\n", extension_count);
 
    // for(size_t i = 0; i < extension_count; i++) {
        // printf("extension %lu: %s\n", i, extensions_info[i].extensionName);
        // printf("spec version: %d\n", extensions_info[i].specVersion);
        // 
        // if(i != extension_count - 1)
            // printf("\n");
    // }
 
    // free(extensions_info);

    // glfwGetRequiredInstanceExtensions will return 
    // the minimal extensions needed for creating vulkan
    // surfaces for glfw windows
    // so far there is no other extension requests
    
    uint32_t glfw_extensions_count;
    const char **glfw_extensions;
    glfw_extensions = glfwGetRequiredInstanceExtensions(&glfw_extensions_count);

    create_info.enabledExtensionCount = glfw_extensions_count;
    create_info.ppEnabledExtensionNames = glfw_extensions;

    if(vkCreateInstance(&create_info, NULL, &instance) != VK_SUCCESS) {
        fprintf(stderr, "failed to create vulkan instance\n");
        return -1;
    }

    /* render loop */

    while(!glfwWindowShouldClose(window)) {
        glfwPollEvents();
    }

    vkDestroyInstance(instance, NULL);

    glfwDestroyWindow(window);
    glfwTerminate();

    return 0;
}

/* key callback for event polling */

static void key_callback(GLFWwindow *window, int key, int scancode, int action, int mods)
{
    if(key == GLFW_KEY_Q && action == GLFW_PRESS)
        glfwSetWindowShouldClose(window, GLFW_TRUE);
}
