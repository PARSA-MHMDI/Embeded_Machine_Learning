# **Embedded AI - Power Consumption Prediction**

<p align="center">
  <img src="./images/AI2.jpg" width="500">
</p>

## **Outline**
1. [Overview](#overview)
2. [Features](#features)
3. [Project Structure](#project-structure)
4. [Installation & Setup](#installation--setup)
5. [Model Architecture](#model-architecture)
6. [Hardware Requirements](#hardware-requirements)
7. [Reference Video](#reference-video)
8. [Data Preprocessing & Model Training](#data-preprocessing--model-training)
9. [Results & Performance](#results--performance)
10. [Future Improvements](#future-improvements)
11. [License](#license)

---

## **Overview**
Embedded AI is a project focused on implementing a machine learning model for power consumption prediction on an STM32F407G Discovery board. The workflow includes training a neural network using TensorFlow, converting the model to TensorFlow Lite (TFLite), and deploying it onto the microcontroller. The embedded system then predicts future power consumption based on historical data.

---

## **Features**
- Trains a neural network model using **TensorFlow**  
- Converts the model to **TensorFlow Lite** for deployment  
- Implements AI inference on an **STM32F407G Discovery Board**  
- Uses **UART communication** for debugging and data visualization  
- Predicts power consumption trends for the upcoming month  
- Optimized for **TinyML and Edge AI processing**  

---

## **Project Structure**
```bash
/project-root
│── /notebooks               # Jupyter Notebooks for data analysis & model training
│── /src                     # Source code for embedded implementation
│── /models                  # Trained models and TFLite conversions
│── /docs                    # Documentation and reports
│── /images                  # README images
│── README.md                # Project Documentation
│── requirements.txt         # Python dependencies
│── LICENSE                  # License information
```

---

## **Installation & Setup**
### **1. Train the AI Model**
- Ensure **Python 3.8+** and **TensorFlow 2.x** are installed.
- Clone the repository and navigate to the project directory:
  ```bash
  git clone https://github.com/yourusername/EmbeddedAI.git
  cd EmbeddedAI
  ```
- Install the required dependencies:
  ```bash
  pip install -r requirements.txt
  ```
- Run the Jupyter Notebook:
  ```bash
  jupyter notebook
  ```
- Train the model and save the final `.tflite` file.

### **2. Convert Model to TFLite**
- In the provided notebook, use:
  ```python
  converter = tf.lite.TFLiteConverter.from_keras_model(model)
  tflite_model = converter.convert()
  ```
- Save the converted model for deployment.

### **3. Flash Model to STM32**
- Install **STM32CubeMX** and **X-CUBE-AI**.  
- Use **STM32CubeIDE** to compile and flash the firmware.  
- Load the model onto the microcontroller and validate using **UART communication**.

---

## **Model Architecture**
The neural network architecture used for power consumption prediction is based on a **1D CNN + Dense Layers** model. The structure is optimized for edge deployment and efficiency in embedded environments.

<p align="center">
  <img src="./images/Model.png" width="600">
</p>

---

## **Hardware Requirements**
- **STM32F407G Discovery Board**

<p align="center">
  <img src="./images/Board.jpg" width="500">
</p>

- **USB-to-TTL Module** (for UART debugging)

<p align="center">
  <img src="./images/USB_TTL.jpg" width="500">
</p>

- **Power Consumption Sensor** (optional for real-time data)
- **Computer with STM32CubeIDE installed**

---

## **Reference Video**
For a detailed step-by-step implementation, watch the following video:

[![Watch on YouTube](https://img.youtube.com/vi/VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=VIDEO_ID)

---

## **Data Preprocessing & Model Training**
The dataset consists of historical power consumption values.  
- **Feature Engineering:**  
  - Removed unnecessary columns  
  - Extracted time-based features (day, month, year)  
  - Normalized data between [0,1]  
- **Model Training:**  
  - Used a **1D CNN + Dense Layers** architecture  
  - Optimized using **Adam optimizer**  
  - Evaluated using **RMSE, MAE, and MAPE**  

**Training Graphs:**  
![Training Graph](./Images/loss.jpg)  

---

## **Results & Performance**
- **Prediction RMSE:** 0.000667201  
- **Memory Usage:** 795.91 KiB  
- **Power Consumption:** 14.68 KiB  

![Report](./images/Report.jpg)

---

## **Future Improvements**
- Improve prediction accuracy by **tuning the CNN architecture**  
- Integrate **real-time power consumption monitoring**  
- Optimize memory usage using **quantization techniques**  
- Expand dataset for **more accurate trend analysis**  

---

## **License**
This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---
