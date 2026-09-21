FROM theteamultroid/ultroid:main

# Set timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Copy requirements terlebih dahulu
COPY requirements.txt .

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt

# Copy installer
COPY installer.sh .

# Jalankan installer
RUN bash installer.sh

# Changing workdir
WORKDIR "/root/TeamUltroid"

# Start the bot
CMD ["bash", "startup"]
