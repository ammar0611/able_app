import 'package:flutter/material.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final Set<String> _appliedJobs = {};
  List<Job> _jobsList = [];

  @override
  void initState() {
    super.initState();
    _jobsList = _getInitialJobs();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  List<Job> _getInitialJobs() {
    return [
      Job(
        id: '1',
        title: 'Accessibility Specialist',
        company: 'TechAbility Solutions',
        location: 'Sydney, NSW',
        salary: '₹5,00,000 - ₹9,00,000 a year',
        type: 'Full-time',
        tags: ['Work from home', 'Inclusive workplace'],
        description:
            'Help us make technology accessible for everyone. Experience with assistive technologies preferred.',
        badge: 'New',
        badgeColor: Colors.pink,
        requirements: ['WCAG', 'Accessibility testing', 'Screen readers'],
        postedDate: 'Posted today',
        isUrgent: true,
      ),
      Job(
        id: '2',
        title: 'Customer Support Representative',
        company: 'Able Tech Services',
        location: 'Melbourne, VIC',
        salary: '₹3,00,000 - ₹5,00,000 a year',
        type: 'Full-time',
        tags: ['Remote', 'Sign language support', 'Flexible timing'],
        description: 'Join our diverse team providing excellent customer support. Sign language skills are a plus.',
        badge: 'Easy Apply',
        badgeColor: Colors.blue,
        requirements: ['Communication skills', 'Problem solving', 'Customer service'],
        postedDate: 'Posted 3 days ago',
        isUrgent: false,
      ),
      Job(
        id: '3',
        title: 'Data Entry Specialist',
        company: 'DataWorks Australia',
        location: 'Brisbane, QLD',
        salary: '₹2,50,000 - ₹4,00,000 a year',
        type: 'Full-time',
        tags: ['Work from home', 'Assistive tech provided', 'Part-time available'],
        description: 'Flexible data entry positions with full accommodation for assistive technologies.',
        badge: 'Hiring multiple candidates',
        badgeColor: Colors.purple,
        requirements: ['MS Office', 'Typing speed 40 WPM', 'Attention to detail'],
        postedDate: 'Posted 5 days ago',
        isUrgent: false,
      ),
      Job(
        id: '4',
        title: 'Content Writer',
        company: 'Able Media',
        location: 'Remote',
        salary: '₹3,50,000 - ₹6,00,000 a year',
        type: 'Full-time',
        tags: ['Work from home', 'Flexible hours', 'Inclusive team'],
        description: 'Create compelling content about accessibility, inclusion, and universal design practices.',
        badge: 'New',
        badgeColor: Colors.pink,
        requirements: ['Content writing', 'SEO', 'Creative writing'],
        postedDate: 'Posted 1 day ago',
        isUrgent: false,
      ),
      Job(
        id: '5',
        title: 'UI/UX Designer - Universal Design',
        company: 'DesignForAll Studio',
        location: 'Perth, WA',
        salary: '₹6,00,000 - ₹10,00,000 a year',
        type: 'Full-time',
        tags: ['Remote option', 'Accessible workspace', 'Creative environment'],
        description:
            'Design beautiful, accessible interfaces that work for everyone. Passion for inclusive design required.',
        badge: 'Featured',
        badgeColor: Colors.green,
        requirements: ['Figma', 'Adobe XD', 'WCAG guidelines', 'Universal design'],
        postedDate: 'Posted 2 days ago',
        isUrgent: true,
      ),
      Job(
        id: '6',
        title: 'Web Developer - Accessibility Engineer',
        company: 'AccessWeb Technologies',
        location: 'Adelaide, SA',
        salary: '₹5,00,000 - ₹8,50,000 a year',
        type: 'Full-time',
        tags: ['Work from home', 'ARIA expertise', 'Inclusive culture'],
        description: 'Build accessible web applications following WCAG standards. Make the web accessible for all.',
        badge: 'Easy Apply',
        badgeColor: Colors.blue,
        requirements: ['HTML', 'CSS', 'JavaScript', 'ARIA', 'WCAG 2.1'],
        postedDate: 'Posted 4 days ago',
        isUrgent: false,
      ),
      Job(
        id: '7',
        title: 'Digital Marketing Specialist',
        company: 'MarketReach Australia',
        location: 'Canberra, ACT',
        salary: '₹3,00,000 - ₹5,50,000 a year',
        type: 'Full-time',
        tags: ['Remote', 'Performance-based bonus', 'Training provided'],
        description: 'Lead digital marketing campaigns with focus on inclusive messaging and diverse audiences.',
        badge: 'Hiring multiple candidates',
        badgeColor: Colors.purple,
        requirements: ['SEO/SEM', 'Social media marketing', 'Google Analytics'],
        postedDate: 'Posted 1 week ago',
        isUrgent: false,
      ),
      Job(
        id: '8',
        title: 'Virtual Assistant',
        company: 'RemoteSupport Services',
        location: 'Remote',
        salary: '₹2,00,000 - ₹3,50,000 a year',
        type: 'Part-time',
        tags: ['Work from home', 'Flexible schedule', 'Entry level'],
        description: 'Provide administrative support remotely. Perfect for those seeking flexible work arrangements.',
        badge: 'Easy Apply',
        badgeColor: Colors.blue,
        requirements: ['Time management', 'MS Office', 'Communication skills'],
        postedDate: 'Posted 3 days ago',
        isUrgent: false,
      ),
      Job(
        id: '9',
        title: 'Graphic Designer',
        company: 'Creative Able Studios',
        location: 'Gold Coast, QLD',
        salary: '₹4,00,000 - ₹7,00,000 a year',
        type: 'Full-time',
        tags: ['Remote option', 'Portfolio based', 'Creative freedom'],
        description: 'Create stunning visual designs for digital and print media. Join our creative team.',
        badge: 'New',
        badgeColor: Colors.pink,
        requirements: ['Adobe Creative Suite', 'Graphic design', 'Portfolio required'],
        postedDate: 'Posted 2 days ago',
        isUrgent: false,
      ),
      Job(
        id: '10',
        title: 'Software Quality Analyst',
        company: 'Able Tech Solutions',
        location: 'Newcastle, NSW',
        salary: '₹4,50,000 - ₹7,50,000 a year',
        type: 'Full-time',
        tags: ['Work from home', 'Testing tools', 'Growth opportunities'],
        description:
            'Ensure software quality through comprehensive testing. Experience with automation tools preferred.',
        badge: 'Hiring multiple candidates',
        badgeColor: Colors.purple,
        requirements: ['Manual testing', 'Automation testing', 'Bug tracking'],
        postedDate: 'Posted 4 days ago',
        isUrgent: true,
      ),
    ];
  }

  Future<Job?> _showAddJobDialog() async {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final companyController = TextEditingController();
    final locationController = TextEditingController();
    final salaryController = TextEditingController();
    final descriptionController = TextEditingController();
    String jobType = 'Full-time';
    final tagsController = TextEditingController();
    final requirementsController = TextEditingController();

    final result = await showModalBottomSheet<Job?>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 16, right: 16, top: 16),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Add New Job', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                          IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.of(context).pop()),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: titleController,
                        decoration: const InputDecoration(labelText: 'Job Title *', border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter job title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: companyController,
                        decoration: const InputDecoration(labelText: 'Company Name *', border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter company name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: locationController,
                        decoration: const InputDecoration(
                          labelText: 'Location *',
                          hintText: 'e.g., Sydney, NSW',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter location';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: salaryController,
                        decoration: const InputDecoration(
                          labelText: 'Salary *',
                          hintText: 'e.g., ₹3,00,000 - ₹5,00,000 a year',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter salary range';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: jobType,
                        decoration: const InputDecoration(labelText: 'Job Type *', border: OutlineInputBorder()),
                        items: [
                          'Full-time',
                          'Part-time',
                          'Contract',
                          'Internship',
                        ].map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
                        onChanged: (value) {
                          setSheetState(() {
                            jobType = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: tagsController,
                        decoration: const InputDecoration(
                          labelText: 'Tags (comma separated)',
                          hintText: 'e.g., Remote, Flexible hours',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: requirementsController,
                        decoration: const InputDecoration(
                          labelText: 'Requirements (comma separated)',
                          hintText: 'e.g., Communication, MS Office',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: descriptionController,
                        decoration: const InputDecoration(labelText: 'Job Description *', border: OutlineInputBorder()),
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter job description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  final newJob = Job(
                                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                                    title: titleController.text,
                                    company: companyController.text,
                                    location: locationController.text,
                                    salary: salaryController.text,
                                    type: jobType,
                                    tags: tagsController.text.isEmpty
                                        ? ['Work from home']
                                        : tagsController.text.split(',').map((e) => e.trim()).toList(),
                                    description: descriptionController.text,
                                    badge: 'New',
                                    badgeColor: Colors.pink,
                                    requirements: requirementsController.text.isEmpty
                                        ? ['No specific requirements']
                                        : requirementsController.text.split(',').map((e) => e.trim()).toList(),
                                    postedDate: 'Posted today',
                                    isUrgent: false,
                                  );

                                  // Clean up controllers
                                  titleController.clear();
                                  companyController.clear();
                                  locationController.clear();
                                  salaryController.clear();
                                  descriptionController.clear();
                                  tagsController.clear();
                                  requirementsController.clear();

                                  // Return the new job
                                  Navigator.of(context).pop(newJob);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[700],
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: const Text('Post Job', style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    // If a job was returned, add it to the list
    if (result != null) {
      setState(() {
        _jobsList.insert(0, result);
      });

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Job posted successfully!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }

    return result;
  }

  void _applyForJob(Job job) {
    setState(() {
      _appliedJobs.add(job.id);
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.green[50], shape: BoxShape.circle),
                child: Icon(Icons.check_circle, color: Colors.green[600], size: 48),
              ),
              const SizedBox(height: 16),
              const Text(
                'Applied Successfully!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your application for',
                style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                job.title,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'at ${job.company}',
                style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'has been successfully submitted!',
                style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue[200]!, width: 1),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue[700], size: 22),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'The employer will review your profile and contact you soon.',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
              child: const Text('Close', style: TextStyle(fontSize: 15)),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[600],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 0,
              ),
              child: const Text('View Applications', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showJobDetails(Job job) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JobDetailsScreen(
          job: job,
          isApplied: _appliedJobs.contains(job.id),
          onApply: () {
            _applyForJob(job);
            Navigator.of(context).pop(); // Close the details screen
          },
        ),
      ),
    );
    // Refresh the state when returning from details screen
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Job Search', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.add_circle_outline), tooltip: 'Add Job', onPressed: _showAddJobDialog),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No new notifications')));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Job search field
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Job title, keywords, or company',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
                const SizedBox(height: 12),
                // Location field
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    hintText: 'Enter city or locality',
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Jobs for you header
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Jobs for you', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Jobs based on your profile', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
          ),
          // Job listings
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8),
              itemCount: _jobsList.length,
              itemBuilder: (context, index) {
                final job = _jobsList[index];
                return _buildJobCard(job);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobCard(Job job) {
    final isApplied = _appliedJobs.contains(job.id);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      child: InkWell(
        onTap: () => _showJobDetails(job),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge and Save button
              Row(
                children: [
                  if (job.badge != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: job.badgeColor?.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        job.badge!,
                        style: TextStyle(color: job.badgeColor, fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                  if (job.isUrgent) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.orange[100], borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        'Urgently hiring',
                        style: TextStyle(color: Colors.orange[900], fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      isApplied ? Icons.bookmark : Icons.bookmark_border,
                      color: isApplied ? Colors.blue[700] : Colors.grey[600],
                    ),
                    onPressed: () {
                      if (!isApplied) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Job saved!')));
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.grey[600]),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${job.title} removed from recommendations'),
                          action: SnackBarAction(label: 'Undo', onPressed: () {}),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Job title
              Text(
                job.title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              // Company name
              Text(job.company, style: TextStyle(fontSize: 15, color: Colors.grey[700])),
              const SizedBox(height: 4),
              // Location
              Text(job.location, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(height: 12),
              // Salary
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(4)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite, color: Colors.green[700], size: 16),
                    const SizedBox(width: 6),
                    Text(
                      job.salary,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.green[900]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              // Job type and tags
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  _buildChip(job.type, Icons.work_outline),
                  ...job.tags.map((tag) => _buildChip(tag, Icons.check_circle_outline)),
                ],
              ),
              const SizedBox(height: 12),
              // Posted date and Easy apply
              Row(
                children: [
                  Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(job.postedDate, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  const Spacer(),
                  if (!isApplied)
                    Row(
                      children: [
                        Icon(Icons.flash_on, size: 16, color: Colors.blue[700]),
                        const SizedBox(width: 4),
                        Text(
                          'Easily apply',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.blue[700]),
                        ),
                      ],
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        'Applied',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.green[700]),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.grey[700]),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
        ],
      ),
    );
  }
}

// Job Details Screen
class JobDetailsScreen extends StatelessWidget {
  final Job job;
  final bool isApplied;
  final VoidCallback onApply;

  const JobDetailsScreen({super.key, required this.job, required this.isApplied, required this.onApply});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(job.title, style: const TextStyle(fontSize: 16)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Share job - Coming soon')));
            },
          ),
          IconButton(
            icon: Icon(isApplied ? Icons.bookmark : Icons.bookmark_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Job saved!')));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company name
                  Text(job.company, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(job.location, style: TextStyle(fontSize: 15, color: Colors.grey[600])),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),
                  // Profile insights section
                  const Text('Profile insights', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    "Here's how the job qualifications align with your profile.",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  // Skills section
                  _buildInsightSection('Skills', job.requirements, Icons.verified, Colors.green),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  // Job details section
                  const Text('Job details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    "Here's how the job details align with your profile.",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  // Pay
                  _buildDetailRow(Icons.payments_outlined, 'Pay', job.salary),
                  const SizedBox(height: 12),
                  // Job type
                  _buildDetailRow(Icons.work_outline, 'Job type', job.type),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  // Benefits
                  const Text('Benefits', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: job.tags
                        .map(
                          (tag) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.check_circle, size: 16, color: Colors.green[700]),
                                const SizedBox(width: 6),
                                Text(tag, style: const TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 16),
                  // Full job description
                  const Text('Full job description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(job.description, style: const TextStyle(fontSize: 15, height: 1.5)),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Icon(Icons.accessible, color: Colors.blue[700], size: 24),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'This employer is committed to creating an inclusive and accessible workplace for all Able individuals.',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          // Apply button at bottom
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: SafeArea(
              child: isApplied
                  ? Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green[300]!),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle, color: Colors.green[700]),
                          const SizedBox(width: 8),
                          Text(
                            'Application Submitted',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green[700]),
                          ),
                        ],
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        onApply();
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                      ),
                      child: const Text('Apply now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightSection(String title, List<String> items, IconData icon, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.lightbulb_outline, size: 20, color: Colors.grey[600]),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 12),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Icon(icon, color: color, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                    child: Text(item, style: const TextStyle(fontSize: 14)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[700]),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[700]),
            ),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}

// Job Model
class Job {
  final String id;
  final String title;
  final String company;
  final String location;
  final String salary;
  final String type;
  final List<String> tags;
  final String description;
  final String? badge;
  final Color? badgeColor;
  final List<String> requirements;
  final String postedDate;
  final bool isUrgent;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.type,
    required this.tags,
    required this.description,
    this.badge,
    this.badgeColor,
    required this.requirements,
    required this.postedDate,
    this.isUrgent = false,
  });
}
