// Function to update user statistics
async function updateUserStats() {
  try {
      const response = await fetch('/api/user-stats');
      const data = await response.json();
      
      document.getElementById('total-users').textContent = `Total Pengguna: ${data.total_users}`;
      document.getElementById('active-users').textContent = `Pengguna Aktif: ${data.active_users}`;
  } catch (error) {
      console.error('Error fetching user stats:', error);
  }
}

// Function to format timestamp to relative time
function formatRelativeTime(timestamp) {
  const date = new Date(timestamp);
  const now = new Date();
  const diffInSeconds = Math.floor((now - date) / 1000);
  
  if (diffInSeconds < 60) return 'baru saja';
  if (diffInSeconds < 3600) return `${Math.floor(diffInSeconds / 60)} menit yang lalu`;
  if (diffInSeconds < 86400) return `${Math.floor(diffInSeconds / 3600)} jam yang lalu`;
  return `${Math.floor(diffInSeconds / 86400)} hari yang lalu`;
}

// Function to update recent activities
async function updateRecentActivities() {
  try {
      const response = await fetch('/api/recent-activities');
      const data = await response.json();
      
      const activitiesList = document.getElementById('recent-activities');
      activitiesList.innerHTML = ''; // Clear existing activities
      
      data.activities.forEach(activity => {
          const li = document.createElement('li');
          li.className = 'activity-item';
          
          const actionText = activity.type === 'registration' 
              ? 'mendaftar sebagai pengguna baru'
              : 'menambahkan data mahasiswa baru';
          
          li.innerHTML = `
              <div class="activity-content">
                  <strong>${activity.name}</strong> ${actionText}
                  <span class="activity-time">${formatRelativeTime(activity.timestamp)}</span>
              </div>
          `;
          
          activitiesList.appendChild(li);
      });
  } catch (error) {
      console.error('Error fetching recent activities:', error);
  }
}

// Initial update
updateUserStats();
updateRecentActivities();

// Update every 30 seconds
setInterval(() => {
  updateUserStats();
  updateRecentActivities();
}, 30000);